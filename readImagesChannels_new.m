function [images_R, images_G, images_B] = readImagesChannels_new(folder_name)
% Read images

filePattern = fullfile(folder_name, '*.Jpeg');
jpegFiles = dir(filePattern);
images_R = {};
images_G = {};
images_B = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(folder_name, baseFileName);
  imageArray = imread(fullFileName);
  images_R (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  images_G(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  images_B(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end



end