function [T] = analysis_GP_channel(SURF_points_train, years_train, SURF_points_test, years_test)
% Performs an analysis of the Gaussian Process for a color channel
% In: SURF_points_train ... n x 20 matrix, n the number of paintings analized
%     years ... n x 1 vector, vector with the years of the paintings
%     SURF_points_test ... m x 20 matrix, m the number of test paintings
%     years_test ... m x 1 vector, vector with the years of the test paintings
%     channel name ... string name of the channel ('Red', 'Green', 'Blue')
% Analysis made:
%      - fit naively a Gaussian process (standard Matlab)

% 

T = zeros(18, 13);

% NOW WE CHANGE SOME PARAMETERS: Kernel function + optimization method


% exponential kernel + quasinewton
T(1, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'exponential', 'quasinewton');

% exponential kernel + lbfgs
T(2, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'exponential', 'lbfgs');


% Matern kernel with parameter 3/2 + quasinewton
T(3, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'matern32', 'quasinewton');

% Matern kernel with parameter 3/2 + lbfgs
T(4, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'matern32', 'lbfgs');


% Matern kernel with parameter 5/2 + quasinewton
T(5, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'matern52', 'quasinewton');

% Matern kernel with parameter 5/2 + lbfgs
T(6, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'matern52', 'lbfgs');


% Rational quadratic kernel + quasinewton
T(7, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'rationalquadratic', 'quasinewton');

% Rational quadratic kernel + lbfgs
T(8, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'rationalquadratic', 'lbfgs');


% Exponential kernel with a separate length scale per predictor + quasinewton
T(9, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardexponential', 'quasinewton');

% Exponential kernel with a separate length scale per predictor + lbfgs
T(10, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardexponential', 'lbfgs');


% Squared exponential kernel with a separate length scale per predictor +
% quasinewton
T(11, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardexponential', 'quasinewton');

% Squared exponential kernel with a separate length scale per predictor +
% lbfgs
T(12, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardexponential', 'lbfgs');


% Matern kernel with parameter 3/2 and a separate length scale per
% predictor + quasinewton 
T(13, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardmatern32', 'quasinewton');

% Matern kernel with parameter 3/2 and a separate length scale per
% predictor + lbfgs
T(14, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardmatern32', 'lbfgs');


% Matern kernel with parameter 5/2 and a separate length scale per
% predictor + quasinewton
T(15, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardmatern52', 'quasinewton');

% Matern kernel with parameter 5/2 and a separate length scale per
% predictor + lbfgs
T(16, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardmatern52', 'lbfgs');


% Rational quadratic kernel with a separate length scale per predictor   +
% quasinewton
T(17, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardrationalquadratic', 'quasinewton');

% Rational quadratic kernel with a separate length scale per predictor   +
% lbfgs
T(18, :) = fitDiff_stats(SURF_points_train, years_train, SURF_points_test, years_test, 'ardrationalquadratic', 'lbfgs');



end


