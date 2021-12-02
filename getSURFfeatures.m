function [ArtistFeatures] = getSURFfeatures(Artist)
% Funcion that extracts the 4 strongest SURF features

[~, m] = size(Artist);
ArtistFeatures = zeros(4*m,64);

for k = 1:m
    I = Artist{k};
    points = detectSURFFeatures(I);
    strongestPoints = selectStrongest(points, 4);
    ArtistFeatures(4*k-3:4*k, :) = extractFeatures(I, strongestPoints);
end