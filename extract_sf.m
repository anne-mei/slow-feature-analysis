function [Q, P, W] = extract_sf(input)
    num_variables = size(input,1);
    resize_index = size(input,1);
    omega = zeros(size(input,1),size(input,1));
    %whitening transformation
    x = cov(transpose(input));
    [U,S,V] = svd(x);
    Q = S^(-1/2)*transpose(U);
    z = Q*input;

    %calculate first order derivative of the input vector
    z_dot = zeros(size(z)-[0,1]);
    for j=2:size(z_dot,2)
        z_dot(:, j-1) = (z(:, j) - z(:, j-1))/3;
    end

    z_dot_cov = cov(transpose(z_dot));
    %evals are in DESCENDING order
    [P_T,omega,P] = svd(z_dot_cov);   %P = eigenvectors = slow features
    
    W = P*Q;
%     W = flip(W,2);
    
    %slowest feature is at smallest e.val
%     [eval, sf_index] = min(diag(omega));
%     sf = P(:,sf_index);
%     sf = W*input;
%     plot_graphs(input, inv(W)*s);
    
    %debugging
%     debug_eqn_12 = cov(transpose(input));   %fine
%     debug_eqn_13_1 = P*cov(transpose(z));   % issue here
%     debug_eqn_13_2 = P*transpose(P);    %P*P_T is fine but P does not equal I
end

