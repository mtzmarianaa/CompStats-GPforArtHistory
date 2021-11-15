function [] = plotEstimatedSURFpoints(points)
% Funcion that extracts plots the 4 strongest SURF points with the
% following parameters given in order
%    - location1
%    - location2
%    - metric
%    - scale
%    - sign of laplacian

loc = zeros(4,2);
loc(:,1) = points(1:4);
loc(:, 2) = points(5:8);
metric = points(9:12)';
scale = points(13:16)';
sgLaplacian = points(17:20)';

resultedSURFPoints = SURFPoints(loc, 'Metric', metric, 'Scale', scale, 'SignOfLaplacian', sgLaplacian);

plot(resultedSURFPoints)

end