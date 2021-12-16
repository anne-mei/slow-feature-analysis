function [normalize_test_data_output] = normalize_test_data(mu, std, x_test)
    normalize_test_data_output = zeros(size(x_test)); %to get the same size output
    for i=1:size(x_test,2)
        f = x_test(:,i);
        f_mean = mu(1,i);
        normalize_test_data_output(:,i) = (f - f_mean)/ std(1,i);
    end
    
%     for i=1:size(x_train,2)
%         f = x_train(:,i);
%         f_mean = mean(f);
%         mu(1,i) = f_mean;
% %         st_dev(1,i) = std(f);
%         normalize_train_data_output(:,i) = (f - f_mean)/ std(f);
%     end
end

