clear all;
close all;

% %load data
% train_data = load('d00.dat');
% train_data = transpose(train_data);
% x_train(:,1:22) = train_data(:,1:22); %continuous process measurement
% x_train(:,23:33) = train_data(:,42:52); %process variable
% 
% test_data = load('d00_te.dat');
% x_test(:,1:22) = test_data(:,1:22); %continuous process measurement
% x_test(:,23:33) = test_data(:,42:52); %process variable

%load data
train_data = load('d00.dat');
x_train(1:22,:) = train_data(1:22,:); %continuous process measurement
x_train(23:33,:) = train_data(42:52,:); %process variable

test_data = load('d00_te.dat');
test_data = transpose(test_data);
x_test(1:22,:) = test_data(1:22,:); %continuous process measurement
x_test(23:33,:) = test_data(42:52,:); %process variable

%get dynamic training and test data
% d=2;
% dy_x_train = get_dynamic_data(x_train, d);
% dy_x_test = get_dynamic_data(x_test, d);

%normalize training data (input signal)
[mu, st_dev, x_train_norm] = normalize_train_data(x_train);

%normalize test data with training set offset
[x_test_norm] = normalize_test_data(mu,x_test);

%extract slow varying features
[Q, P, W] = extract_sf(x_train_norm);

%apply extracted slow features to test data
num_sf = 33;
data_prediction = make_prediction(x_test_norm, W, num_sf);

plot_graphs(x_test_norm, data_prediction);