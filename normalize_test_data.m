function [normalize_test_data_output] = normalize_test_data(mu, std, x_test)
    normalize_test_data_output = zeros(size(x_test)); %to get the same size output
    for i=1:size(x_test,2)
        f = x_test(:,i);
        f_mean = mu(1,i);
        normalize_test_data_output(:,i) = (f - f_mean)/ std(1,i);
    end
end

