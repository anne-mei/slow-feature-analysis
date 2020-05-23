function [dynamic_data] = get_dynamic_data(static_data,d)
    [n, m] = size(static_data);
    dynamic_data = zeros(n-d, m*(d+1));
    
    for i=0:d
        dynamic_data(:,i*m+1:(i+1)*m) = static_data(d+1-i:n-i, :); 
    end
end

