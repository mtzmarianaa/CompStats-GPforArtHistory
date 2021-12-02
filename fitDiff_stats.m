function [stats_method] = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, KernelFunction, Optimizer)
tic()
method = fitrgp(SURF_points_train, years_train, 'KernelFunction', KernelFunction, 'Optimizer', Optimizer);
% Lets see how we did on our training data
[predictions_training,~,intervals_training] = predict(method, SURF_points_train);
error_L2_train = norm( predictions_training -  years_train);
error_Linf_train = norm( predictions_training -  years_train, 'Inf');
max_interval_length_train = norm( intervals_training(:,1) - intervals_training(:,2), 'Inf' );
% We try this with the test data
[predictions_test,~,intervals_test] = predict(method, SURF_points_test);
error_L2_test = norm( predictions_test -  years_test);
error_Linf_test = norm( predictions_test -  years_test, 'Inf');
max_interval_length_test = norm( intervals_test(:,1) - intervals_test(:,2), 'Inf' );
time_taken = toc();
stats_method = [error_L2_train, error_Linf_train, ...
    max_interval_length_train, error_L2_test, ..., 
    error_Linf_test, max_interval_length_test, time_taken];

end