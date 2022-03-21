%% Prob. 2 of HW 5: Generate Random (Realized) Samples from Posterior Distribution through MH algorithm.

posterior = @(x) exp(-abs(4-x).^0.5-(1/8)*(x-5).^2);
q = @(x) exp(-(1/8)*(x-5).^2);

X = [0 10 50 100];
Mean_X = [0 10 50 100];
Var_X = [0 0 0 0];

for j = 1:4
    for i = 1:10000
        Y = normrnd(5,2);
        a = (posterior(Y).*q(X(i,j)) ) / (posterior(X(i,j)).*q(Y) ); %% MH ratio
        rho = min(a,1);
        if rand <= rho
            X(i+1,j) = Y;
        else
            X(i+1,j) = X(i,j);
        end
        Mean_X(i+1,j) = mean(X(1:i+1,j));
        Var_X(i+1,j) = var(X(1:i+1,j));
    end
end

for k = 1:4 
    subplot(2,2,k)
    stairs( X(:,k) )
    set(gca, 'FontSize', 20)
    title(sprintf('starting point= %d', X(1,k)), 'FontSize', 20)
end

for k = 1:4 
    figure(k);
    
    subplot(1,2,1);
    plot(Mean_X(:,k), 'linewidth', 2);
    set(gca, 'FontSize', 20);
    text(10^4+1, Mean_X(10001,k), [;, num2str(Mean_X(10001,k))], 'HorizontalAlignment', 'left', 'FontSize', 25);
    title(sprintf('Estimated Posterior Mean when Starting Point = %d', X(1,k)), 'FontSize', 20);
    
    subplot(1,2,2);
    plot(Var_X(:,k), 'linewidth', 2);
    set(gca, 'FontSize', 20);
    text(10^4+1, Var_X(10001,j), [;, num2str(Var_X(10001,k))], 'HorizontalAlignment', 'left', 'FontSize', 25);
    title(sprintf('Estimated Posterior Variance when Starting Point = %d', X(1,k)), 'FontSize', 20);
end
