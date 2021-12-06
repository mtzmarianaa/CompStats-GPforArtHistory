function [RamosMartR,RamosMartG, RamosMartB, RiveraR, RiveraG, RiveraB, ...
    FridaR, FridaG, FridaB, AtlR, AtlG, AtlB, OrozcoR, OrozcoG, OrozcoB, ...
    VaroR, VaroG, VaroB, TamayoR, TamayoG, TamayoB , ...
    MarinR, MarinG, MarinB, VasconcelosR, VasconcelosG, VasconcelosB, ...
    RebullR, RebullG, RebullB] = readImagesChannels()
% This function reads paintings (from images) from 10 different Mexican
% aritsts. This function also standarizes the scale so that each image
% read has the same size.


% We read the images (it is convenient to separate them)

% Alfredo Ramos Martinez
myFolder = 'AlfredoRamosMartinez';
filePattern = fullfile(myFolder, '*.Jpeg');
jpegFiles = dir(filePattern);
RamosMartR = {};
RamosMartG = {};
RamosMartB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  RamosMartR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  RamosMartG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  RamosMartB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end



% Diego Rivera
myFolder = 'DiegoRivera';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
RiveraR = {};
RiveraG = {};
RiveraB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  RiveraR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  RiveraG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  RiveraB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end


% Frida Kahlo
myFolder = 'FridaKahlo';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
FridaR = {};
FridaG = {};
FridaB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  FridaR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  FridaG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  FridaB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end


% Gerardo Murillo (Dr Atl)
myFolder = 'GerardoMurillo';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
AtlR = {};
AtlG = {};
AtlB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  AtlR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  AtlG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  AtlB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end

% Jose Clemente Orozco
myFolder = 'JoseClementeOrozco';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
OrozcoR = {};
OrozcoG = {};
OrozcoB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  OrozcoR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  OrozcoG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  OrozcoB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end



% Remedios Varo
myFolder = 'RemediosVaro';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
VaroR = {};
VaroG = {};
VaroB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  VaroR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  VaroG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  VaroB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end

% Rufino Tamayo
myFolder = 'RufinoTamayo';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
TamayoR = {};
TamayoG = {};
TamayoB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  TamayoR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  TamayoG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  TamayoB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end



% Javier Marin
myFolder = 'JavierMarin';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
MarinR = {};
MarinG = {};
MarinB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  MarinR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  MarinG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  MarinB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end



% Jose Maria Vasconcelos
myFolder = 'Vasconcelos';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
VasconcelosR = {};
VasconcelosG = {};
VasconcelosB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  VasconcelosR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  VasconcelosG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  VasconcelosB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end


% Santiago Rebull
myFolder = 'SantiagoRebull';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
RebullR = {};
RebullG = {};
RebullB = {};
i = 1;
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  RebullR (i) = {imresize(imageArray(:,:,1), [1536, 2048])};
  RebullG(i) = {imresize(imageArray(:,:,2), [1536, 2048])};
  RebullB(i) = {imresize(imageArray(:,:,3), [1536, 2048])};
  i = i+1;
end






end