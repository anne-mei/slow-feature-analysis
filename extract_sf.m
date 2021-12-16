function [Q, P, W, omega, z, z_dot, s] = extract_sf(x)
    %whitening transformation
    [U,S,V] = svd(cov(x));
    Q = S^(-1/2)*transpose(U);
    z = x*Q'; %*transpose(x);

    %calculate first order derivative of the x vector
    z_dot = zeros(size(z)-[1,0]); %TODO: remove these zero matrices
    for j=2:size(z_dot,1)+1
        z_dot(j-1,:) = (z(j,:) - z(j-1,:))/3;
    end

    z_dot_cov = cov(z_dot);
    %evals are in DESCENDING order
    [P,omega,P_T] = svd(z_dot_cov);   %P = eigenvectors
    omega = diag(omega);
    [omega,I] = sort(omega, 'ascend');
    omega = diag(omega);
    P = P(:,I);  %P is ordered according to ascending evals
    
    W = P'*Q;
    
    %check eqn 14 conditions:
    check_I = P*cov(z)*P';
    p = P(:,2);
    check_omega_2 = p'*z_dot_cov*p;
    
%     s_check_dot = z_dot*P;
    s_check = z*P;
    x_check = s_check*inv(W');
    
    s = x*W';
%     cov(s);
    s_dot = zeros(size(s)-[1,0]);
    for k=2:size(s_dot,1)+1
        s_dot(k-1,:) = (s(k,:) - s(k-1,:))/3;
    end
    
    s2_dot_cov = cov(s_dot(:,1));
    s3_dot_cov = cov(s_dot(:,2));

end

