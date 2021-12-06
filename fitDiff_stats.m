function [stats_method, problematic_training, ...
    problematic_testing] = fitDiff_stats(SURF_points_train, years_train, ...
    SURF_points_test, years_test, KernelFunction, Optimizer)
tic()
method = fitrgp(SURF_points_train, years_train, 'KernelFunction', KernelFunction, 'Optimizer', Optimizer);
% Lets see how we did on our training data
[predictions_training,~,intervals_training] = predict(method, SURF_points_train);
error_L2_train = norm( predictions_training -  years_train);
error_Linf_train = norm( predictions_training -  years_train, 'Inf');
error_average_train = mean( abs( predictions_training -  years_train ) );
max_interval_length_train = norm( intervals_training(:,1) - ...
    intervals_training(:,2), 'Inf' );
interval_length_average_train = mean(  abs( intervals_training(:,1) ...
    - intervals_training(:,2) )  );
which_worse_train = find( abs(intervals_training(:,1) - intervals_training(:,2)) ...
    == max_interval_length_train);
which_worse_train = which_worse_train(1,1);
percentage_lowerError_mean_train = length( find( abs( predictions_training ...
    -  years_train ) <=   error_average_train  ))/length(predictions_training);

problematic_training = find( abs( predictions_training - ...
    years_train ) >  error_average_train  );

% We try this with the test data
[predictions_test,~,intervals_test] = predict(method, SURF_points_test);
error_L2_test = norm( predictions_test -  years_test);
error_Linf_test = norm( predictions_test -  years_test, 'Inf');
error_average_test = mean( abs( predictions_test -  years_test ) );
max_interval_length_test = norm( intervals_test(:,1) - intervals_test(:,2), 'Inf' );
interval_length_average_test = mean( abs( intervals_test(:,1) - intervals_test(:,2) ) );
which_worse_test = find( abs(intervals_test(:,1) - intervals_test(:,2)) ==  max_interval_length_test );
which_worse_test = which_worse_test(1,1);
percentage_lowerError_mean_test = length( find( abs( predictions_test -  years_test ) <=   error_average_test  ))/length(predictions_test);

problematic_testing = find( abs( predictions_test -  years_test ) >  ...
    error_average_test  );

time_taken = toc();

stats_method = [error_L2_train, error_Linf_train, error_average_train, ...
    max_interval_length_train, interval_length_average_train, which_worse_train, ...
    percentage_lowerError_mean_train, error_L2_test, error_Linf_test, error_average_test, ...
    max_interval_length_test, interval_length_average_test, which_worse_test,...
    percentage_lowerError_mean_test, time_taken];

end