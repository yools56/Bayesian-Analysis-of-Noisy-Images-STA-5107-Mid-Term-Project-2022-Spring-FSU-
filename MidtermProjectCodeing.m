%% Prob. 2 of HW 6: Generate Random (Realized) Samples from Full Conditional Distribution through Gibbs Sampler algorithm based on the MRF structure of given Data Set.
%% For ImageFile'k', where k=1,...,4.

for k = 1:4
    load(['ImageFile' num2str(k) '.mat']);
    a= struct2cell(load(['ImageFile' num2str(k) '.mat']));
    %% Generate Matrix to store the (Realized) Sample Value(s) of I_[i,j] site(s), where i=1,...,60, j=1,...,90. 
    I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } = cat(2, a{:});
    
    %% Generate Matrix to store the Sample Mean Value(s) of neighbors of I_[i,j] site, where i=1,...,60, j=1,...,90. 
    Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } = zeros(60,90); %% We will treat each element of this matrix as a Population Mean for I[i,j] Site.
    
       
 %% We are going to obtain and store all of the Sample Mean Value(s) corresponding to I_[i,j] site(s), where i=1,...,60, j=1,...,90 via the following Matlab Code. 
 %% Finally, we can get I matrix whose dimension is 60 X 90 with Var(I) = 0.01^2   
        for j= 1:90 %% left or right
            for i=1:60 %% top to bottom
                if i==1
                    if j==1
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 2; % left upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    elseif j==90
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) ) / 2; % right upper dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    else
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) ) / 3; % upper line 
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    end
                       
                elseif i==60
                    if j==1
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 2; % left bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    elseif j==90
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) ) / 2; % right bottom dot
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    else
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) ) / 3; % bottom line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    end
                else 
                    if j==1
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 3; % left line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    elseif j==90
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) ) / 3; % right line
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    else
                        mean = ( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i-1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i+1, j) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j-1) + I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j+1) ) / 4; % middle square
                        Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i , j ) = mean;
                    end
                end
                
                I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }( i, j ) = normrnd( mean, sqrt(0.01^2) ); %% I matrix with Var_of_I: Sigma_1 = 0.01
            end
        end
        
end

 
%% Let's generate Generate Matrix, denoted by D_i_comma_j, to store the (Realized) Value(s) of D_[i,j](s) (Noisy Observation(s)),
%% where i=1,...,60, j=1,...,90, where  D_[i,j] =  I_[i,j] + W_[i,j], where W_[i,j] ~ ind (0, sqrt(sigma^2))

%% Ref: Prob. 2 of HW 6: Generate Random (Realized) Samples from Full Conditional Distribution through Gibbs Sampler algorithm based on the MRF structure of given Data Set.
%% For ImageFile'k', where k=1,...,4.

%% Generate W matrix First
% W_matrix_with_Var_of_W_sigma_2_0_01=normrnd(0,sqrt(0.01^2),[60,90]);


%% Now, let's generate D Matrix whose elements are denoted by D_i_comma_j as follows: dimension is 60 X 90. 
for k = 1:4 %% For each ImageFile'k' set,
    D_Matrix_for_D_i_comma_j_with_Var_of_W_sigma_2_0_01{ k } = I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k } + normrnd(0,sqrt(0.01^2),[60,90]);
end


%% Now, let's obtain the Posterior Sample from Posterior dis. via MH algorithm as follows:

%% Ref: Prob. 2 of HW 5: Generate Random (Realized) Samples from Posterior Distribution through MH algorithm.

%% I will denote input variable as 'x'.

%q = @(x) exp(-(1/8)*(x-5).^2);

%X = [0 10 50 100];
%Mean_X = [0 10 50 100];
%Var_X = [0 0 0 0];

Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

Ratio_Cell_with_Var_of_I_Sigma_1_and_Var_of_W_Sigma_2_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.


for k=1:4

   % Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.
   % Ratio_Cell_with_Var_of_I_Sigma_1_and_Var_of_W_Sigma_2_0_01 = cell(60,90,4); %% Generate Cell to store the Samples from the Posterior Dis.

 for i = 1:60
   for j = 1:90
              f = @(x) (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j))^2) * (1/sqrt(2*pi*0.01^2)) * exp((-1/(2*0.01^2))*(x-D_Matrix_for_D_i_comma_j_with_Var_of_W_sigma_2_0_01{ k }(i,j))^2);
              
              MH = 20; %% Iteration Number
              
              X = zeros(1,MH); %% Initial Values for I
              
              Y = zeros(1,MH-1);
              
              P = ones(2,MH-1);
              
              m = zeros(1,MH-1);
              
              X(1) = rand(1);
              
              ratio = 0;
              
                    for h = 1:MH
                        
                         Y(h) = normrnd(Sample_Mean_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{ k }(i,j),0.01); %% Prior
                         
                         P(1,h) = f(Y(h)) / f(X(h)); %% MH Ratio
                         
                         m(h) = min(P(1,h),P(2,h)); %% Acceptance Ratio
                         
                         if rand(1) < m(h)
                             
                          X(h+1) = Y(h);
                          
                         ratio = ratio + 1;
                         
                         else
                        
                        X(h+1) = Y(h);
                        
                         end
                    end
                Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{i,j,k} = X;
                Ratio_Cell_with_Var_of_I_Sigma_1_and_Var_of_W_Sigma_2_0_01{i,j,k} = ratio / MH;
    end
 end
end

%%%%%%

       % imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{1} );
       % imagesc( Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{1,1,1} );

    
% Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{1,1,1}(2)


%% Let's gather 1st Posterior Sample of Each Site in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_with_First_Posterior_Samples_of_given_Data_Matrix = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_with_First_Posterior_Samples_of_given_Data_Matrix(i,j)=Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{i,j,1}(2);
    end
end


%% Let's Draw the 1st Original image with 1st Image with 1st Posterior Sample Matrix of I.
subplot(1,2,1)
 imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{1} ); 
 subplot(1,2,2)
 imagesc( Matrix_with_First_Posterior_Samples_of_given_Data_Matrix );

 
 %% Let's gather 5th Posterior Sample of Each Site in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_with_Fifth_Posterior_Samples_of_given_Data_Matrix = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_with_Fifth_Posterior_Samples_of_given_Data_Matrix(i,j)=Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{i,j,1}(6);
    end
end

subplot(1,2,1)
 imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{1} ); 
 subplot(1,2,2)
 imagesc( Matrix_with_Fifth_Posterior_Samples_of_given_Data_Matrix );
 

 
 %% Let's gather 10th Posterior Sample of Each Site in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_with_Tenth_Posterior_Samples_of_given_Data_Matrix = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_with_Tenth_Posterior_Samples_of_given_Data_Matrix(i,j)=Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{i,j,1}(11);
    end
end

subplot(1,2,1)
 imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{1} ); 
 subplot(1,2,2)
 imagesc( Matrix_with_Tenth_Posterior_Samples_of_given_Data_Matrix );
 
 
 
  %% Let's gather 20th Posterior Sample of Each Site in the above obtained 60 X 90 Posterior Sample Cell as follow:

Matrix_with_Twentyth_Posterior_Samples_of_given_Data_Matrix = zeros(60,90); %% Initialize the matrix with zero elements.

for i = 1:60
    for j = 1:90
        Matrix_with_Twentyth_Posterior_Samples_of_given_Data_Matrix(i,j)=Posterior_Sample_Cell_with_Var_of_I_and_Var_of_W_0_01{i,j,1}(21);
    end
end

subplot(1,2,1)
 imagesc( I_Matrix_for_I_i_comma_j_with_Var_of_I_Sigma_1_0_01{1} ); 
 subplot(1,2,2)
 imagesc( Matrix_with_Twentyth_Posterior_Samples_of_given_Data_Matrix );
