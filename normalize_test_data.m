function [normalize_test_data_output] = normalize_test_data(mu,x_test)
    normalize_test_data_output = x_test; %to get the same size output
    for i=1:size(x_test,1)
        row = x_test(i,:);
        row_mean = mu(i);
        normalize_test_data_output(i,:) = (row - row_mean)/ sqrt(mean((row - row_mean).^2));
    end
end

