function [mu,st_dev,normalize_train_data_output] = normalize_train_data(x_train)
    normalize_train_data_output = x_train; %to get the same size output
    mu = zeros(size(x_train,1),1);
    st_dev = zeros(size(x_train,1),1);
    for i=1:size(x_train,1)
        row = x_train(i,:);
        row_mean = mean(row);
        mu(i,1) = row_mean;
        st_dev(i,1) = std(row);
        normalize_train_data_output(i,:) = (row - row_mean)/ sqrt(mean((row - row_mean).^2));
    end
end

