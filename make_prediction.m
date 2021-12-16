function [s,prediction] = make_prediction(x, W, num_sf, s_train)
%     s = W*x';
    s = x*W';
    W_inv = inv(W);
    W_inv(:, num_sf+1:end) = 0;
    prediction = s*W_inv;
%     s = transpose(s);
end

