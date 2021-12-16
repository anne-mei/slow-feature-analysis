function [T,Te,XM,XMe,S,Se,FM,FMe] = calculate_indices(s, M, omega)
    Me = size(s,2)-M;
    a = 0.99;
    sd = s(:,1:M);
    se = s(:,M+1:end);
    N = size(s,1);
    T = zeros(1,N);
    Te = zeros(1,N);
    for i=1:N
        T(1,i) = sd(i,:)*sd(i,:)';
        Te(1,i) = se(i,:)*se(i,:)';
    end
    XM = chi2inv(a,M);
    XMe = chi2inv(a,Me);
    
%     s_dot = zeros(size(s)-[1,0]);
%     for k=2:size(s_dot,1)+1
%         s_dot(k-1,:) = (s(k,:) - s(k-1,:))/3;
%     end
    
    sd_dot = zeros(size(sd)-[1,0]);
    for j=2:size(sd_dot,1)+1
        sd_dot(j-1,:) = (sd(j,:) - sd(j-1,:))/3;
    end
    se_dot = zeros(size(se)-[1,0]);
    for j=2:size(se_dot,1)+1
        se_dot(j-1,:) = (se(j,:) - se(j-1,:))/3;
    end
    Wd = cov(sd_dot);
    We = cov(se_dot);
    
    omega_d = omega(1:M,1:M);
    omega_e = omega(M+1:end,M+1:end);
    
    S = zeros(1,N-1);
    Se = zeros(1,N-1);
    for k=1:N-1
        S(1,k) = sd_dot(k,:)*inv(omega_d)*sd_dot(k,:)';
        Se(1,k) = se_dot(k,:)*inv(omega_e)*se_dot(k,:)';
    end
    
    g=(M*(N^2-2*N))/((N-1)*(N-M-1));
    ge=(Me*(N^2-2*N))/((N-1)*(N-Me-1));
    
    FM = finv(a,M,N-M-1)*g;
    FMe = finv(a,Me,N-Me-1)*ge;
    
end

