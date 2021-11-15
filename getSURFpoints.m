function [ArtistPoints] = getSURFpoints(Artist)
% Funcion that extracts the 10 strongest SURF points of each painting by each of the
% artists' channels. These are:
%    - location
%    - metric
%    - scale
%    - sign of laplacian

[~, m] = size(Artist);
ArtistPoints = zeros(m,20);

for k = 1:m
    I = Artist{k};
    points = detectSURFFeatures(I);
    strongestPoints = selectStrongest(points, 4);
    ArtistPoints(k, :) = [double(strongestPoints.Location(:, 1)'),double(strongestPoints.Location(:, 2)'), double(strongestPoints.Metric'), double(strongestPoints.Scale'), double(strongestPoints.SignOfLaplacian')];
end