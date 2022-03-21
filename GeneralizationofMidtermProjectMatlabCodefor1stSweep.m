%% Prob. 2 of HW 6: Generate Random (Realized) Samples from Full Conditional Distribution through Gibbs Sampler algorithm based on the MRF structure of given Data Set.
%% For ImageFile'k', where k=1,...,4.

%% Vector of Simga 1 of R.V : I
Vector_of_Sigma_1_of_I_Random_Variable = [0.01, 0.1, 0.5, 1];

%% Vector of Simga 2 of R.V : W, which will be a stanard deviation of N(D[i,j],(sigma 2)^2) when it comes to deriving Posterior
%% dis. of I given D and all other pixels.
Vector_of_Sigma_2_of_W_Random_Variable = [0.01, 0.1, 0.5, 1];



for k = 1:4
    load(['ImageFile' num2str(k) '.mat']);
    a= struct2cell(load(['ImageFile' num2str(k) '.mat']));
    %% Generate Matrix to store the (Realized) Sample Value(s) of I_[i,j](s), where i=1,...,60, j=1,...,90, where [i,j] is (i,j)th site. 
    I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } = cat(2, a{:});
    I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } = cat(2, a{:});
    I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } = cat(2, a{:});
    I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } = cat(2, a{:});
    
    
    %% Generate Matrix to store the Sample Mean Value(s) of neighbors of I_[i,j] site, where i=1,...,60, j=1,...,90. 
    %% First, we have to initialize the above matrix with having all zero elements.
    Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } = zeros(60,90); %% We will treat each element of this matrix as a Population Mean(s) for each I[i,j].
    Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } = zeros(60,90); %% We will treat each element of this matrix as a Population Mean(s) for each I[i,j].
    Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } = zeros(60,90); %% We will treat each element of this matrix as a Population Mean(s) for each I[i,j].
    Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } = zeros(60,90); %% We will treat each element of this matrix as a Population Mean(s) for each I[i,j].
    
    
    
  %  figure(k);
  %  subplot( 1, 11, 1);
  %  colormap('gray');
  %  imagesc(I);
  %  axis image;
  %  axis equal off;
  %  title( [ 'Original Image ' num2str(k) ], 'fontsize', 20);
       
 %% We are going to obtain and store all of the Sample Mean Value(s) corresponding to I_[i,j]s, where i=1,...,60, j=1,...,90 via the following Matlab Code. 
 %% Plus, we are going to store all of the Realized Random Numbers of I[i,j]s.
 
 %% Finally, we can get (realized) I matrix whose dimension is 60 X 90 with Var(I) = 0.01^2   
 %% Plus, mu_[i,j] matrix whose dimension is 60 X 90.
  
%%%  for m=1:5 %% for 10 sweeps, we set 'm' from '1' to '10'.
        for j= 1:90 %% left or right
            for i=1:60 %% top to bottom
                if i==1
                    if j==1
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 2; % left upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) ) / 2; % left upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) ) / 2; % left upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) ) / 2; % left upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                        
                    elseif j==90
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) ) / 2; % right upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) ) / 2; % right upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) ) / 2; % right upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) ) / 2; % right upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                 
                    else
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) ) / 3; % upper line 
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) ) / 3; % upper line 
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) ) / 3; % upper line 
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) ) / 3; % upper line 
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                    end
                       
                elseif i==60
                    if j==1
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 2; % left bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) ) / 2; % left bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;

                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) ) / 2; % left bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;

                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) ) / 2; % left bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;

                                
                    elseif j==90
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) ) / 2; % right bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) ) / 2; % right bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) ) / 2; % right bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) ) / 2; % right bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                        
                    else
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) ) / 3; % bottom line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) ) / 3; % bottom line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) ) / 3; % bottom line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) ) / 3; % bottom line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                        
                    end
                else 
                    if j==1
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 3; % left line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) ) / 3; % left line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) ) / 3; % left line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) ) / 3; % left line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                    elseif j==90
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) ) / 3; % right line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) ) / 3; % right line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) ) / 3; % right line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) ) / 3; % right line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                        
                    else
                        mean_1 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 4; % middle square
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean_1;
                        
                        mean_2 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j+1) ) / 4; % middle square
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i , j ) = mean_2;
                        
                        mean_3 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j+1) ) / 4; % middle square
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i , j ) = mean_3;
                        
                        mean_4 = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j+1) ) / 4; % middle square
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i , j ) = mean_4;
                        
                        
                      
                    end
                end
                
                I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j ) = normrnd( mean_1, sqrt(Vector_of_Sigma_1_of_I_Random_Variable(1)^2) ); %% I matrix with Var_of_I: Sigma_1 = 0.01
                
                I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }( i, j ) = normrnd( mean_2, sqrt(Vector_of_Sigma_1_of_I_Random_Variable(2)^2) ); %% I matrix with Var_of_I: Sigma_1 = 0.1

                I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }( i, j ) = normrnd( mean_3, sqrt(Vector_of_Sigma_1_of_I_Random_Variable(3)^2) ); %% I matrix with Var_of_I: Sigma_1 = 0.5

                I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }( i, j ) = normrnd( mean_4, sqrt(Vector_of_Sigma_1_of_I_Random_Variable(4)^2) ); %% I matrix with Var_of_I: Sigma_1 = 1

                
            end
        end
        
     %   subplot(1, 11, m+1);
     %   colormap('gray');
     %   imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } );
    
    %    axis image;
    %    axis equal off;
    %    title(['Sweep', num2str(m)], 'fontsize', 20);
        
        
        
        
    %     subplot(1, 11, m+1);
    %     colormap('gray');
    %     imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } );
       
    %     axis image;
    %     axis equal off;
    %     title(['Sweep', num2str(m)], 'fontsize', 20);
        
        
        
     %   subplot(1, 11, m+1);
     %   colormap('gray');
     %   imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } );
   
      %  axis image;
      %  axis equal off;
      %  title(['Sweep', num2str(m)], 'fontsize', 20);
        
        
        
    %    subplot(1, 11, m+1);
    %    colormap('gray');
    %    imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } );
  
    %    axis image;
    %    axis equal off;
    %    title(['Sweep', num2str(m)], 'fontsize', 20);
        
        
        
end
%%% end


 
%% Let's generate Generate Matrix, denoted by D_i_comma_j, to store the (Realized) Value(s) of D_[i,j](s) (Noisy Observation(s)),
%% where i=1,...,60, j=1,...,90, where  D_[i,j] =  I_[i,j] + W_[i,j], where W_[i,j] ~ ind (0, sqrt(sigma^2))

%% Ref: Prob. 2 of HW 6: Generate Random (Realized) Samples from Full Conditional Distribution through Gibbs Sampler algorithm based on the MRF structure of given Data Set.
%% For ImageFile'k', where k=1,...,4.

%% Generate W matrix First
% W_matrix_with_Var_of_W_sigma_2_0_01=normrnd(0,sqrt(0.01^2),[60,90]);


%% Now, let's generate D Matrix whose elements are denoted by D_i_comma_j as follows: dimension is 60 X 90. 
for k = 1:4 %% For each ImageFile'k' set,
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_01{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(1)^2),[60,90]);
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(2)^2),[60,90]);
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_5{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(3)^2),[60,90]);

    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(4)^2),[60,90]);
  
    
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_01{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(1)^2),[60,90]);
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(2)^2),[60,90]);
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_5{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(3)^2),[60,90]);

    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(4)^2),[60,90]);
  
    
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_01{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(1)^2),[60,90]);
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(2)^2),[60,90]);
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_5{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(3)^2),[60,90]);

    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(4)^2),[60,90]);
  
    
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_01{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(1)^2),[60,90]);
    
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(2)^2),[60,90]);
  
    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_5{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(3)^2),[60,90]);

    D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_1{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k } + normrnd(0,sqrt(Vector_of_Sigma_2_of_W_Random_Variable(4)^2),[60,90]);
    
end


%% Now, let's obtain the Posterior Sample from Posterior dis. via MH algorithm as follows:

%% Ref: Prob. 2 of HW 5: Generate Random (Realized) Samples from Posterior Distribution through MH algorithm.

%% I will denote input variable as 'x'.

%q = @(x) exp(-(1/8)*(x-5).^2);

%X = [0 10 50 100];
%Mean_X = [0 10 50 100];
%Var_X = [0 0 0 0];

Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.


Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.


Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.


Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.





Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_01  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_5  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.



Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_01  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_5  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.



Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_01  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_5  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.



Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_01  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_5  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_1  = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.



for k=1:4

 for i = 1:60
   for j = 1:90
              f_1 = @(x) (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j))^2) * (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_01{ k }(i,j))^2);
              
              f_2 = @(x) (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j))^2) * (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_1{ k }(i,j))^2);
              
              f_3 = @(x) (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j))^2) * (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_0_5{ k }(i,j))^2);
              
              f_4 = @(x) (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j))^2) * (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_01_Sigma_of_W_1{ k }(i,j))^2);
              
              
              
              f_5 = @(x) (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_01{ k }(i,j))^2);
              
              f_6 = @(x) (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_1{ k }(i,j))^2);
              
              f_7 = @(x) (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_0_5{ k }(i,j))^2);
              
              f_8 = @(x) (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j))^2) * (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_1_Sigma_of_W_1{ k }(i,j))^2);
              
              
              
              f_9 = @(x) (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j))^2) * (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_01{ k }(i,j))^2);
              
              f_10 = @(x) (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j))^2) * (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_1{ k }(i,j))^2);
              
              f_11 = @(x) (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j))^2) * (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_0_5{ k }(i,j))^2);
              
              f_12 = @(x) (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j))^2) * (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_0_5_Sigma_of_W_1{ k }(i,j))^2);
              
              
              
              f_13 = @(x) (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_01{ k }(i,j))^2);
              
              f_14 = @(x) (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.1^2)) * exp((-1/(2*0.1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_1{ k }(i,j))^2);
              
              f_15 = @(x) (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j))^2) * (1/sqrt(2*pi*0.5^2)) * exp((-1/(2*0.5^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_0_5{ k }(i,j))^2);
              
              f_16 = @(x) (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j))^2) * (1/sqrt(2*pi*1^2)) * exp((-1/(2*1^2))*(x-D_Matrix_for_D_i_comma_j_with_Sigma_of_I_1_Sigma_of_W_1{ k }(i,j))^2);
              
           
             
              
              
              MH = 20; %% Iteration Number
              
              
              X_1 = zeros(1,MH); %% Initial Values for I
              
              X_2 = zeros(1,MH); %% Initial Values for I
              
              X_3 = zeros(1,MH); %% Initial Values for I
              
              X_4 = zeros(1,MH); %% Initial Values for I
              
              X_5 = zeros(1,MH); %% Initial Values for I
              
              X_6 = zeros(1,MH); %% Initial Values for I
              
              X_7 = zeros(1,MH); %% Initial Values for I
              
              X_8 = zeros(1,MH); %% Initial Values for I
              
              X_9 = zeros(1,MH); %% Initial Values for I
              
              X_10 = zeros(1,MH); %% Initial Values for I
              
              X_11 = zeros(1,MH); %% Initial Values for I
              
              X_12 = zeros(1,MH); %% Initial Values for I
               
              X_13 = zeros(1,MH); %% Initial Values for I
              
              X_14 = zeros(1,MH); %% Initial Values for I
              
              X_15 = zeros(1,MH); %% Initial Values for I
              
              X_16 = zeros(1,MH); %% Initial Values for I
              
              
              
              Y_1 = zeros(1,MH-1);
              
              Y_2 = zeros(1,MH-1);
              
              Y_3 = zeros(1,MH-1);
              
              Y_4 = zeros(1,MH-1);
              
              Y_5 = zeros(1,MH-1);
              
              Y_6 = zeros(1,MH-1);
              
              Y_7 = zeros(1,MH-1);
              
              Y_8 = zeros(1,MH-1);
             
              Y_9 = zeros(1,MH-1);
              
              Y_10 = zeros(1,MH-1);
              
              Y_11 = zeros(1,MH-1);
              
              Y_12 = zeros(1,MH-1);
              
              Y_13 = zeros(1,MH-1);
              
              Y_14 = zeros(1,MH-1);
              
              Y_15 = zeros(1,MH-1);
              
              Y_16 = zeros(1,MH-1);
              
              
              
              P_1 = ones(2,MH-1);
              
              P_2 = ones(2,MH-1);
              
              P_3 = ones(2,MH-1);
              
              P_4 = ones(2,MH-1);
              
              P_5 = ones(2,MH-1);
              
              P_6 = ones(2,MH-1);
              
              P_7 = ones(2,MH-1);
              
              P_8 = ones(2,MH-1);
              
              P_9 = ones(2,MH-1);
              
              P_10 = ones(2,MH-1);
              
              P_11 = ones(2,MH-1);
              
              P_12 = ones(2,MH-1);
              
              P_13 = ones(2,MH-1);
              
              P_14 = ones(2,MH-1);
              
              P_15 = ones(2,MH-1);
              
              P_16 = ones(2,MH-1);
              
              
              
              m_1 = zeros(1,MH-1);
              
              m_2 = zeros(1,MH-1);
              
              m_3 = zeros(1,MH-1);
              
              m_4 = zeros(1,MH-1);
              
              m_5 = zeros(1,MH-1);
              
              m_6 = zeros(1,MH-1);
              
              m_7 = zeros(1,MH-1);
              
              m_8 = zeros(1,MH-1);
              
              m_9 = zeros(1,MH-1);
              
              m_10 = zeros(1,MH-1);
              
              m_11 = zeros(1,MH-1);
              
              m_12 = zeros(1,MH-1);
              
              m_13 = zeros(1,MH-1);
              
              m_14 = zeros(1,MH-1);
              
              m_15 = zeros(1,MH-1);
              
              m_16 = zeros(1,MH-1);
              
              
              
              
              X_1(1) = rand(1);
              
              X_2(1) = rand(1);
              
              X_3(1) = rand(1);
              
              X_4(1) = rand(1);
              
              X_5(1) = rand(1);
              
              X_6(1) = rand(1);
              
              X_7(1) = rand(1);
              
              X_8(1) = rand(1);
              
              X_9(1) = rand(1);
              
              X_10(1) = rand(1);
              
              X_11(1) = rand(1);
              
              X_12(1) = rand(1);
              
              X_13(1) = rand(1);
              
              X_14(1) = rand(1);
              
              X_15(1) = rand(1);
              
              X_16(1) = rand(1);
              
              
              
              
              ratio_1 = 0;
              
              ratio_2 = 0;
              
              ratio_3 = 0;
              
              ratio_4 = 0;
              
              ratio_5 = 0;
              
              ratio_6 = 0;
              
              ratio_7 = 0;
              
              ratio_8 = 0;
              
              ratio_9 = 0;
              
              ratio_10 = 0;
              
              ratio_11 = 0;
              
              ratio_12 = 0;
              
              ratio_13 = 0;
              
              ratio_14 = 0;
              
              ratio_15 = 0;
              
              ratio_16 = 0;
              
                  
                    
              
              for h = 1:MH
                        
                         Y_1(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(1)); %% Prior
                         
                         Y_2(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(1)); %% Prior
                        
                         Y_3(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(1)); %% Prior
                        
                         Y_4(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(1)); %% Prior
                         
                         
                         
                         
                         Y_5(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(2)); %% Prior
                         
                         Y_6(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(2)); %% Prior
                         
                         Y_7(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(2)); %% Prior
                         
                         Y_8(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(2)); %% Prior
                         
                         
                         
                         
                         Y_9(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(3)); %% Prior
                        
                         Y_10(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(3)); %% Prior
                        
                         Y_11(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(3)); %% Prior
                        
                         Y_12(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_5{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(3)); %% Prior
                        
                         
                         
                         Y_13(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(4)); %% Prior
                         
                         Y_14(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(4)); %% Prior
                         
                         Y_15(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(4)); %% Prior
                         
                         Y_16(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_1{ k }(i,j),Vector_of_Sigma_1_of_I_Random_Variable(4)); %% Prior
                         
                         
                         
                         
                         P_1(1,h) = f_1(Y_1(h)) / f_1(X_1(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_2(1,h) = f_2(Y_2(h)) / f_2(X_2(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_3(1,h) = f_3(Y_3(h)) / f_3(X_3(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_4(1,h) = f_4(Y_4(h)) / f_4(X_4(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                       
                         
                         P_5(1,h) = f_5(Y_5(h)) / f_5(X_5(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_6(1,h) = f_6(Y_6(h)) / f_6(X_6(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_7(1,h) = f_7(Y_7(h)) / f_7(X_7(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_8(1,h) = f_8(Y_8(h)) / f_8(X_8(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                      
                         
                         
                         P_9(1,h) = f_9(Y_9(h)) / f_9(X_9(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_10(1,h) = f_10(Y_10(h)) / f_10(X_10(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_11(1,h) = f_11(Y_11(h)) / f_11(X_11(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_12(1,h) = f_12(Y_12(h)) / f_12(X_12(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                      
                         
                         
                         P_13(1,h) = f_13(Y_13(h)) / f_13(X_13(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_14(1,h) = f_14(Y_14(h)) / f_14(X_14(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_15(1,h) = f_15(Y_15(h)) / f_15(X_15(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                         
                         P_16(1,h) = f_16(Y_16(h)) / f_16(X_16(h)); %% MH Ratio (Since Proposal Density (Prior) is Normal, MH Ratio is the LR.)
                      
                       
                         
                         
                         m_1(h) = min(P_1(1,h),P_1(2,h)); %% Acceptance Ratio
                         
                         m_2(h) = min(P_2(1,h),P_2(2,h)); %% Acceptance Ratio
                         
                         m_3(h) = min(P_3(1,h),P_3(2,h)); %% Acceptance Ratio
                         
                         m_4(h) = min(P_4(1,h),P_4(2,h)); %% Acceptance Ratio
                         
                         m_5(h) = min(P_5(1,h),P_5(2,h)); %% Acceptance Ratio
                         
                         m_6(h) = min(P_6(1,h),P_6(2,h)); %% Acceptance Ratio
                         
                         m_7(h) = min(P_7(1,h),P_7(2,h)); %% Acceptance Ratio
                         
                         m_8(h) = min(P_8(1,h),P_8(2,h)); %% Acceptance Ratio
                         
                         m_9(h) = min(P_9(1,h),P_9(2,h)); %% Acceptance Ratio
                         
                         m_10(h) = min(P_10(1,h),P_10(2,h)); %% Acceptance Ratio
                         
                         m_11(h) = min(P_11(1,h),P_11(2,h)); %% Acceptance Ratio
                         
                         m_12(h) = min(P_12(1,h),P_12(2,h)); %% Acceptance Ratio
                         
                         m_13(h) = min(P_13(1,h),P_13(2,h)); %% Acceptance Ratio
                         
                         m_14(h) = min(P_14(1,h),P_14(2,h)); %% Acceptance Ratio
                         
                         m_15(h) = min(P_15(1,h),P_15(2,h)); %% Acceptance Ratio
                         
                         m_16(h) = min(P_16(1,h),P_16(2,h)); %% Acceptance Ratio
                         
                         
                         
                         
                         if rand(1) < m_1(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_1(h+1) = Y_1(h);
                          
                         ratio_1 = ratio_1 + 1;
                         
                         else
                        
                        X_1(h+1) = X_1(h);
                        
                        
                           
                         if rand(1) < m_2(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_2(h+1) = Y_2(h);
                          
                         ratio_2 = ratio_2 + 1;
                         
                         else
                        
                        X_2(h+1) = X_2(h);
                        
                        
                        
                        if rand(1) < m_3(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_3(h+1) = Y_3(h);
                          
                         ratio_3 = ratio_3 + 1;
                         
                         else
                        
                        X_3(h+1) = X_3(h);
                        
                        
                        if rand(1) < m_4(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_4(h+1) = Y_4(h);
                          
                         ratio_4 = ratio_4 + 1;
                         
                         else
                        
                        X_4(h+1) = X_4(h);
                        
                        
                        
                        
                        
                         if rand(1) < m_5(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_5(h+1) = Y_5(h);
                          
                         ratio_5 = ratio_5 + 1;
                         
                         else
                        
                        X_5(h+1) = X_5(h);
                        
                        
                        if rand(1) < m_6(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_6(h+1) = Y_6(h);
                          
                         ratio_6 = ratio_6 + 1;
                         
                         else
                        
                        X_6(h+1) = X_6(h);
                        
                        
                        if rand(1) < m_7(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_7(h+1) = Y_7(h);
                          
                         ratio_7 = ratio_7 + 1;
                         
                         else
                        
                        X_7(h+1) = X_7(h);
                        
                        
                        if rand(1) < m_8(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_8(h+1) = Y_8(h);
                          
                         ratio_8 = ratio_8 + 1;
                         
                         else
                        
                        X_8(h+1) = X_8(h);
                        
                        
                        
                        
                        
                        
                         if rand(1) < m_9(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_9(h+1) = Y_9(h);
                          
                         ratio_9 = ratio_9 + 1;
                         
                         else
                        
                        X_9(h+1) = X_9(h);
                        
                        
                         if rand(1) < m_10(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_10(h+1) = Y_10(h);
                          
                         ratio_10 = ratio_10 + 1;
                         
                         else
                        
                        X_10(h+1) = X_10(h);
                        
                        
                         if rand(1) < m_11(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_11(h+1) = Y_11(h);
                          
                         ratio_11 = ratio_11 + 1;
                         
                         else
                        
                        X_11(h+1) = X_11(h);
                        
                        
                         if rand(1) < m_12(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_12(h+1) = Y_12(h);
                          
                         ratio_12 = ratio_12 + 1;
                         
                         else
                        
                        X_12(h+1) = X_12(h);
                        
                        
                        
                         if rand(1) < m_13(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_13(h+1) = Y_13(h);
                          
                         ratio_13 = ratio_13 + 1;
                         
                         else
                        
                        X_13(h+1) = X_13(h);
                        
                        
                         if rand(1) < m_14(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_14(h+1) = Y_14(h);
                          
                         ratio_14 = ratio_14 + 1;
                         
                         else
                        
                        X_14(h+1) = X_14(h);
                        
                        
                          if rand(1) < m_15(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_15(h+1) = Y_15(h);
                          
                         ratio_15 = ratio_15 + 1;
                         
                         else
                        
                        X_15(h+1) = X_15(h);
                        
                        
                          if rand(1) < m_16(h) %% rand(1): a (Realized) Random Sample From U[0,1] (which is compared to Acceptance Ratio).
                             
                          X_16(h+1) = Y_16(h);
                          
                         ratio_16 = ratio_16 + 1;
                         
                         else
                        
                        X_16(h+1) = X_16(h);
                        
                        
                        
                         end
                         end
                    
                Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,k} = X_1;
                Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,k} = ratio_1 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,k} = X_2;
                Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,k} = ratio_2 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,k} = X_3;
                Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,k} = ratio_3 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,k} = X_4;
                Ratio_Cell_with_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,k} = ratio_4 / MH;
                
                
                
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,k} = X_5;
                Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,k} = ratio_5 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,k} = X_6;
                Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,k} = ratio_6 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,k} = X_7;
                Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,k} = ratio_7 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,k} = X_8;
                Ratio_Cell_with_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,k} = ratio_8 / MH;
                
                
                
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,k} = X_9;
                Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,k} = ratio_9 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,k} = X_10;
                Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,k} = ratio_10 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,k} = X_11;
                Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,k} = ratio_11 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,k} = X_12;
                Ratio_Cell_with_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,k} = ratio_12 / MH;
                
                
                
                
                
                Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,k} = X_13;
                Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,k} = ratio_13 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,k} = X_14;
                Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,k} = ratio_14 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,k} = X_15;
                Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,k} = ratio_15 / MH;
                
                Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,k} = X_16;
                Ratio_Cell_with_with_Sigma_of_I_1_Sigma_of_W_1{i,j,k} = ratio_16 / MH;
               
                
    end
 end
 end

                        end
                         end
                         end
              end
   end
                        end
                         end
                        end
                        end
                         end
                         end
              end
   end
 end
end







%%%%%%%%%%%%%%%%% 1. For the First Image (FI) with 1st Sweep I[site]

%%%%%%%%%% There would be total 16 cases in terms of (Sigma 1, Sigma 2)

%%%% 1) Sigma 1: 0.01, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma1 and Sigma2 are both 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 
 
 
%%%% 2) Sigma 1: 0.01, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 
 
 
 
 %%%% 3) Sigma 1: 0.01, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,1}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 
 
 
 
 %%%% 4) Sigma 1: 0.01, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,1}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 
 
 
 
 %%%% 5) Sigma 1: 0.1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,1}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 
 
 
 
  %%%% 6) Sigma 1: 0.1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 
 
 
 
   %%%% 7) Sigma 1: 0.1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 
 
 
 
   %%%% 8) Sigma 1: 0.1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 
 
 
 
 %%%% 9) Sigma 1: 0.5, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 
 
 
 
 %%%% 10) Sigma 1: 0.5, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 
 
 
 
 %%%% 11) Sigma 1: 0.5, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 
 
 
 
  %%%% 12) Sigma 1: 0.5, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 
 
 
 
  %%%% 13) Sigma 1: 1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 
 
 
 
  %%%% 14) Sigma 1: 1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 
 
 
 
   %%%% 15) Sigma 1: 1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 
 
 
 
 
  %%%% 16) Sigma 1: 1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,1}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,1}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,1}(21);
    end
end




%% Let's Draw the 1st Original image with 1st Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI );
 
 
 
 
 %%%%%%%%%%%%%%%%% 2. For the Second Image (SI) with 1st Sweep I[site]

%%%%%%%%%% There would be total 16 cases in terms of (Sigma 1, Sigma 2)

%%%% 1) Sigma 1: 0.01, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma1 and Sigma2 are both 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI );
 
 
 
 
%%%% 2) Sigma 1: 0.01, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_SI );
 
 
 
 
 
 %%%% 3) Sigma 1: 0.01, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,2}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_SI );
 
 
 
 
 
 %%%% 4) Sigma 1: 0.01, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,2}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI );
 
 
 
 
 
 %%%% 5) Sigma 1: 0.1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,2}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_SI );
 
 
 
 
 
  %%%% 6) Sigma 1: 0.1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_SI );
 
 
 
 
 
   %%%% 7) Sigma 1: 0.1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_SI );
 
 
 
 
 
   %%%% 8) Sigma 1: 0.1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_SI );
 
 
 
 
 
 %%%% 9) Sigma 1: 0.5, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_SI );
 
 
 
 
 
 %%%% 10) Sigma 1: 0.5, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_SI );
 
 
 
 
 
 %%%% 11) Sigma 1: 0.5, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_SI );
 
 
 
 
 
  %%%% 12) Sigma 1: 0.5, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_SI );
 
 
 
 
 
  %%%% 13) Sigma 1: 1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI );
 
 
 
 
 
  %%%% 14) Sigma 1: 1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_SI );
 
 
 
 
 
   %%%% 15) Sigma 1: 1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_SI );
 
 
 
 
 
  %%%% 16) Sigma 1: 1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,2}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,2}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,2}(21);
    end
end




%% Let's Draw the 2nd Original image with 2nd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_SI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI );
 
 
 
 
 
 
 
 
 
  %%%%%%%%%%%%%%%%% 3. For the Third Image (TI) with 1st Sweep I[site]

%%%%%%%%%% There would be total 16 cases in terms of (Sigma 1, Sigma 2)

%%%% 1) Sigma 1: 0.01, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma1 and Sigma2 are both 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI );
 
 
 
 
%%%% 2) Sigma 1: 0.01, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_TI );
 
 
 
 
 
 %%%% 3) Sigma 1: 0.01, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,3}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_TI );
 
 
 
 
 
 %%%% 4) Sigma 1: 0.01, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,3}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI );
 
 
 
 
 
 %%%% 5) Sigma 1: 0.1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,3}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_TI );
 
 
 
 
 
  %%%% 6) Sigma 1: 0.1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_TI );
 
 
 
 
 
   %%%% 7) Sigma 1: 0.1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_TI );
 
 
 
 
 
   %%%% 8) Sigma 1: 0.1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_TI );
 
 
 
 
 
 %%%% 9) Sigma 1: 0.5, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_TI );
 
 
 
 
 
 %%%% 10) Sigma 1: 0.5, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_TI );
 
 
 
 
 
 %%%% 11) Sigma 1: 0.5, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_TI );
 
 
 
 
 
  %%%% 12) Sigma 1: 0.5, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_TI );
 
 
 
 
 
  %%%% 13) Sigma 1: 1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI );
 
 
 
 
 
  %%%% 14) Sigma 1: 1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_TI );
 
 
 
 
 
   %%%% 15) Sigma 1: 1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_TI );
 
 
 
 
 
  %%%% 16) Sigma 1: 1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,3}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,3}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,3}(21);
    end
end




%% Let's Draw the 3rd Original image with 3rd Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_TI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI );
 
 
 
 
 
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%% 4. For the Fourth Image (FI) with 1st Sweep I[site]

%%%%%%%%%% There would be total 16 cases in terms of (Sigma 1, Sigma 2)

%%%% 1) Sigma 1: 0.01, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_01{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma1 and Sigma2 are both 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI );
 
 
 
 
%%%% 2) Sigma 1: 0.01, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_1_FI );
 
 
 
 
 
 %%%% 3) Sigma 1: 0.01, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,4}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_0_5{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_5_FI );
 
 
 
 
 
 %%%% 4) Sigma 1: 0.01, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,4}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_01_Sigma_of_W_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.01 and Sigma2 : 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI );
 
 
 
 
 
 %%%% 5) Sigma 1: 0.1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,4}(2);
    end
end



%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_01{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_01_FI );
 
 
 
 
 
  %%%% 6) Sigma 1: 0.1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2 : 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_1_FI );
 
 
 
 
 
   %%%% 7) Sigma 1: 0.1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_0_5{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_FI );
 
 
 
 
 
   %%%% 8) Sigma 1: 0.1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_1_Sigma_of_W_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_1_FI );
 
 
 
 
 
 %%%% 9) Sigma 1: 0.5, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_01{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_01_FI );
 
 
 
 
 
 %%%% 10) Sigma 1: 0.5, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_FI );
 
 
 
 
 
 %%%% 11) Sigma 1: 0.5, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_0_5{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 0.5 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_5_FI );
 
 
 
 
 
  %%%% 12) Sigma 1: 0.5, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_0_5_Sigma_of_W_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 0.5 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_1_FI );
 
 
 
 
 
  %%%% 13) Sigma 1: 1, and Sigma 2: 0.01

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_01{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.01 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI );
 
 
 
 
 
  %%%% 14) Sigma 1: 1, and Sigma 2: 0.1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 0.1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_1_FI );
 
 
 
 
 
   %%%% 15) Sigma 1: 1, and Sigma 2: 0.5

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_0_5{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_5_FI );
 
 
 
 
 
  %%%% 16) Sigma 1: 1, and Sigma 2: 1

%% Let's gather 1st Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,4}(2);
    end
end


%% Let's gather 10th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,4}(11);
    end
end


%% Let's gather 20th Posterior Sample of I[Each Site] in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI(i,j)=Posterior_Sample_Cell_with_Sigma_of_I_1_Sigma_of_W_1{i,j,4}(21);
    end
end




%% Let's Draw the 4th Original image with 4th Image with 1st, 10th, and 20th Posterior Sample Matrices of I[each site]
%% for the 1st sweeping, and Sigma 1: 1 and Sigma2: 1 as follow:

 subplot(2,2,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(2,2,2)
 colormap('gray');
 imagesc( Matrix_1st_Post_Samples_with_Sigma_of_I_1_Sigma_of_W_1_FI );
 
 subplot(2,2,3)
 colormap('gray');
 imagesc( Matrix_10th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI );
 
 subplot(2,2,4)
 colormap('gray');
 imagesc( Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI );