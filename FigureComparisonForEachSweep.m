%% 1st, 5th, and 10th Sweep Images with 20th Posterior Samples from Posterior Density for ith original Images, where i=1,...4.

%% 1st (Original) Image or 1st Image (with 20th Posterior Samples) : 1I

%% 2nd (Original) Image or 1st Image (with 20th Posterior Samples) : SI

%% 3rd (Original) Image or 1st Image (with 20th Posterior Samples) : TI

%% 4th (Original) Image or 1st Image (with 20th Posterior Samples) : FI


%%%%%%%% For 1I for some cases: 1) Sigma 1 = 0.01, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_1I;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_1I;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_1I_w_10S );
 
 
 
 
 
 
%% 2) Sigma 1 = 0.01, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_1I;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_1I;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_1I_w_10S );
 
 
 
 
 
 
 %% 3) Sigma 1 = 0.1, and Sigma 2 = 0.5.

Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_1I;


Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_1I;


Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_1_Sigma_of_W_0_5_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_1_Sigma_of_W_0_5_1I_w_10S );
 
 
 
 
 
 
 %% 4) Sigma 1 = 0.5, and Sigma 2 = 0.1.

Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_1I;


Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_1I;


Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_5_Sigma_of_W_0_1_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_5_Sigma_of_W_0_1_1I_w_10S );
 
 
 
 
 
 
 %% 5) Sigma 1 = 1, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_1I;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_1I;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_1I_w_10S );
 
 
 
 
 
 
 %% 6) Sigma 1 = 1, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_1I;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_1I;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_1I;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_1I_w_10S );
 
 
 
 
 
 
 
 
 
 
 %%%%%%%% For SI for some cases: 1) Sigma 1 = 0.01, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_SI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_SI_w_10S );
 
 
 
 
 
 
%% 2) Sigma 1 = 0.01, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_SI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_SI_w_10S );
 
 
 
 
 
 
 %% 3) Sigma 1 = 1, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_SI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_SI_w_10S );
 
 
 
 
 
 
 %% 4) Sigma 1 = 1, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_SI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_SI_w_10S );
 
 
 
 
 
 
 
 
 
  %%%%%%%% For TI for some cases: 1) Sigma 1 = 0.01, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_TI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_TI_w_10S );
 
 
 
 
 
 
%% 2) Sigma 1 = 0.01, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_TI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_TI_w_10S );
 
 
 
 
 
 
 %% 3) Sigma 1 = 1, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_TI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_TI_w_10S );
 
 
 
 
 
 
 %% 4) Sigma 1 = 1, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_TI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_TI_w_10S );
 
 
 
 
 
 
 
 
 
  %%%%%%%% For FI for some cases: 1) Sigma 1 = 0.01, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_0_01_FI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_0_01_FI_w_10S );
 
 
 
 
 
 
%% 2) Sigma 1 = 0.01, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI;


Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_0_01_Sigma_of_W_1_FI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_0_01_Sigma_of_W_1_FI_w_10S );
 
 
 
 
 
 
 %% 3) Sigma 1 = 1, and Sigma 2 = 0.01.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_0_01_FI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_0_01_FI_w_10S );
 
 
 
 
 
 
 %% 4) Sigma 1 = 1, and Sigma 2 = 1.

Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_FS = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_5S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI;


Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_10S = Matrix_20th_Post_Samples_w_Sigma_of_I_1_Sigma_of_W_1_FI;


 subplot(1,4,1)
 colormap('gray');
 imagesc( I ); 
 
 subplot(1,4,2)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_FS );
 
 subplot(1,4,3)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_5S );
 
 subplot(1,4,4)
 colormap('gray');
 imagesc( Matrix_20th_PS_with_Sigma_of_I_1_Sigma_of_W_1_FI_w_10S );