clear all;
close all;

%load data
train_data = load('TE_process/d00.dat');
train_data = transpose(train_data);
x_train(:,1:22) = train_data(:,1:22); %continuous process measurement
x_train(:,23:33) = train_data(:,42:52); %process variable

test_data = load('TE_process/d10_te.dat');
x_test(:,1:22) = test_data(:,1:22); %continuous process measurement
x_test(:,23:33) = test_data(:,42:52); %process variable

%get dynamic training and test data
d=2;
dy_x_train = get_dynamic_data(x_train, d);
dy_x_test = get_dynamic_data(x_test, d);

%train algorithm
[mu, st_dev, x_train_norm] = normalize_train_data(dy_x_train);
[Q, P, W, omega, z, z_dot, s_train] = extract_sf(x_train_norm);

%apply algorithm
num_sf = 55;
[x_test_norm] = normalize_test_data(mu, st_dev, dy_x_test);
[s,data_prediction] = make_prediction(x_test_norm, W, num_sf, s_train);
% plot_graphs(x_test_norm, data_prediction);

[T,Te,XM,XMe,S,Se,FM,FMe] = calculate_indices(s, num_sf, omega);

% feature_i = 9;
plot_indices(T,Te,XM,XMe,S,Se,FM,FMe);


