function [mu,st_dev,normalize_train_data_output] = normalize_train_data(x_train)
    normalize_train_data_output = zeros(size(x_train)); %to get the same size output
    mu = zeros(1,size(x_train,2));
    st_dev = zeros(1,size(x_train,2));
    for i=1:size(x_train,2)
        f = x_train(:,i);
        f_mean = mean(f);
        mu(1,i) = f_mean;
        st_dev(1,i) = std(f);
        normalize_train_data_output(:,i) = (f - f_mean)/ std(f);
    end
end

