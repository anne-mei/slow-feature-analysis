function  plot_graphs(orig_data,prediction, num_features)
    sample = linspace(1,size(orig_data,2),size(orig_data,2));
    data_length = size(orig_data,1);
    mse_vec = zeros(1, data_length);
    for i=1:data_length
        mse = immse( orig_data(i, :) , prediction(i, :) );
        mse_vec(1, i) = mse;
        if i<7
            figure(i);
            plot(sample,orig_data(i, :), 'b');
            hold on;
            plot(sample,prediction(i, :), 'r');
            str = strcat({'Slow Feature '}, num2str(i));
            title(str);
            xlabel('Sample #');
            ylabel('Data');
            legend('Original Data','Prediction');

            %get and display mse on plot
            a = gca; % get the current axis;
            a.Position(3) = 0.6;
            annotation('textbox', [0.75, 0.1, 0.1, 0.1], 'String', "MSE: " + mse);
            hold off;
        end
    end
%     fprintf('max mse: %s\n',max(mse_vec));
%     fprintf('min mse: %s\n',min(mse_vec));
    fprintf('max mse: %.6f \n', max(mse_vec));
    fprintf('min mse: %.6f \n', min(mse_vec));
end

