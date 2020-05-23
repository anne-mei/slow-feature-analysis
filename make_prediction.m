function [prediction] = make_prediction(x_test_norm, W, num_sf)
    s = W*x_test_norm;
    W_inv = inv(W);
    W_inv(:, num_sf+1:end) = 0;
    prediction = W_inv*s;
end

