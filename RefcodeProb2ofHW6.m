%% Prob. 2 of HW 6: Generate Random (Realized) Samples from Full Conditional Distribution through Gibbs Sampler algorithm based on the MRF structure of given Data Set.
%% For ImageFile'k', where k=1,...,4.

for k = 1:4
    load(['ImageFile' num2str(k) '.mat']);
    a= struct2cell(load(['ImageFile' num2str(k) '.mat']));
    MC{ k } = cat(2, a{:});
    
    figure(k);
    subplot( 1, 6, 1);
    colormap('gray');
    imagesc(I);
    axis image;
    axis equal off;
    title( [ 'Original Image ' num2str(k) ], 'fontsize', 20);
    
    for m= 1:5 %% for 5 sweeps, we set 'm' from '1' to '5'.
        for j= 1:90 %% left or right
            for i=1:60 %% top to bottom
                if i==1
                    if j==1
                        mean = ( MC{ k }( i+1, j) + MC{ k }( i, j+1) ) / 2; % left upper dot
                    elseif j==90
                        mean = ( MC{ k }( i, j-1) + MC{ k }( i+1, j) ) / 2; % right upper dot
                    else
                        mean = ( MC{ k }( i, j-1) + MC{ k }( i, j+1) + MC{ k }( i+1, j) ) / 3; % upper line 
                    end
                       
                elseif i==60
                    if j==1
                        mean = ( MC{ k }( i-1, j) + MC{ k }( i, j+1) ) / 2; % left bottom dot
                    elseif j==90
                        mean = ( MC{ k }( i, j-1) + MC{ k }( i-1, j) ) / 2; % right bottom dot
                    else
                        mean = ( MC{ k }( i, j-1) + MC{ k }( i, j+1) + MC{ k }( i-1, j) ) / 3; % bottom line
                    end
                else 
                    if j==1
                        mean = ( MC{ k }( i-1, j) + MC{ k }( i+1, j) + MC{ k }( i, j+1) ) / 3; % left line
                    elseif j==90
                        mean = ( MC{ k }( i-1, j) + MC{ k }( i+1, j) + MC{ k }( i, j-1) ) / 3; % right line
                    else
                        mean = ( MC{ k }( i-1, j) + MC{ k }( i+1, j) + MC{ k }( i, j-1) + MC{ k }( i, j+1) ) / 4; % middle square
                    end
                end
                
                MC{ k }( i, j ) = normrnd( mean, sqrt(0.1) );
            end
        end
        
        subplot(1, 6, m+1);
        colormap('gray');
        imagesc( MC{k} );
        axis image;
        axis equal off;
        title(['sweep', num2str(m)], 'fontsize', 20);
    end
end
