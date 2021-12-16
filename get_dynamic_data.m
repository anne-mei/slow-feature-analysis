function [dynamic_data] = get_dynamic_data(static_data,d)
    [n, m] = size(static_data);
%     dynamic_data = zeros(n-d, m*(d+1));
    
    for i=1:d+1
        dynamic_data(:,(i-1)*m+1:i*m) = static_data(i:n-(d-i+1), :); 
    end
end

