function L = loglike(mle_data, theta)
    
    % Data size
    n_size = size(mle_data,2);
    
    % Log likelihood components 
    comp1 = mle_data.*log(theta);
    comp2 = -1*n_size*log(log(1/(1-theta)));
    
    % L is the output that is return
    % Note this is -1* log likehood since we are minimizing
    L = -(sum(comp1) + comp2);
    
end
