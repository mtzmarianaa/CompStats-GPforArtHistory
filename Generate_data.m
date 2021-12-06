% Script to obtain the SURF vectors and SURF features. This might be slow
% but it gives the same variables as the ones saved in
% generated_data_variables.mat so if you don't want to run this all over
% again you can just do "load generated_data_variables.mat"


tic()
% We read the images

% training data
[RamosMartR,RamosMartG, RamosMartB, RiveraR, RiveraG, RiveraB, ...
    FridaR, FridaG, FridaB, AtlR, AtlG, AtlB, OrozcoR, OrozcoG, OrozcoB, ...
    VaroR, VaroG, VaroB, TamayoR, TamayoG, TamayoB , ...
    MarinR, MarinG, MarinB, VasconcelosR, VasconcelosG, VasconcelosB, ...
    RebullR, RebullG, RebullB] = readImagesChannels();
% test data
[test_R, test_G, test_B] = readImagesChannels_new('Test_set_known');
% unknown dates data
[unknown_R, unknown_G, unknown_B] = readImagesChannels_new('Test_set_unknown');

% We read the paintins' metadata
% training
METAD = readtable("Paintings_metadata_general.csv");
years_training = METAD{:, 'Year'};
years_training_features = zeros(4*length(years_training), 1);
for k=1:length(years_training)
    years_training_features(4*k-3:4*k) = years_training(k);
end
% test
METAD_test = readtable("Paintings_metadata_test.csv");
years_test = METAD_test{:, 'Year'};
years_test_features = zeros(4*length(years_test), 1);
for k=1:length(years_test)
    years_test_features(4*k-3:4*k) = years_test(k);
end

% For each channel (red, green, blue) we get the SURF descriptors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RED

% training
RamosMartRSURFPoints = getSURFpoints(RamosMartR);
RiveraRSURFPoints = getSURFpoints(RiveraR);
FridaRSURFPoints = getSURFpoints(FridaR);
AtlRSURFPoints = getSURFpoints(AtlR);
OrozcoRSURFPoints = getSURFpoints(OrozcoR);
VaroRSURFPoints = getSURFpoints(VaroR);
TamayoRSURFPoints = getSURFpoints(TamayoR);
MarinRSURFPoints = getSURFpoints(MarinR);
VasconcelosRSURFPoints = getSURFpoints(VasconcelosR);
RebullRSURFPoints = getSURFpoints(RebullR);


RedChannelPoints_train = [RamosMartRSURFPoints;  ...
    RiveraRSURFPoints; FridaRSURFPoints; AtlRSURFPoints; ...
    OrozcoRSURFPoints; VaroRSURFPoints; TamayoRSURFPoints;
    VasconcelosRSURFPoints; RebullRSURFPoints; MarinRSURFPoints];

xlswrite("Red_training", [ years_training , RedChannelPoints_train]);

% Training with features
RamosMartRSURFfeat = getSURFfeatures(RamosMartR);
RiveraRSURFfeat = getSURFfeatures(RiveraR);
FridaRSURFfeat = getSURFfeatures(FridaR);
AtlRSURFfeat = getSURFfeatures(AtlR);
OrozcoRSURFfeat = getSURFfeatures(OrozcoR);
VaroRSURFfeat = getSURFfeatures(VaroR);
TamayoRSURFfeat = getSURFfeatures(TamayoR);
MarinRSURFfeat = getSURFfeatures(MarinR);
VasconcelosRSURFfeat = getSURFfeatures(VasconcelosR);
RebullRSURFfeat = getSURFfeatures(RebullR);


RedChannelfeat_train = [RamosMartRSURFfeat;  ...
    RiveraRSURFfeat; FridaRSURFfeat; AtlRSURFfeat; ...
    OrozcoRSURFfeat; VaroRSURFfeat; TamayoRSURFfeat;
    VasconcelosRSURFfeat; RebullRSURFfeat; MarinRSURFfeat];

xlswrite("Red_training_feat", [ years_training_features , RedChannelfeat_train]);


% PCA
coeff_red = pca(RedChannelPoints_train);
% we just use the first 5 PC
RedChannelPoints_train_PC = RedChannelPoints_train*coeff_red(:, 1:5);
xlswrite("Red_training_PC", [ years_training , RedChannelPoints_train_PC]);

coeff_red_feat = pca(RedChannelfeat_train);
% we just use the first 5 PC
RedChannelfeat_train_PC = RedChannelfeat_train*coeff_red_feat(:, 1:5);
xlswrite("Red_training_PC_feat", [ years_training_features , RedChannelfeat_train_PC])

% test
testRSURFPoints = getSURFpoints(test_R);
xlswrite("Red_test", [ years_test , testRSURFPoints]);

testRSURFfeat = getSURFfeatures(test_R);
xlswrite("Red_test_feat", [ years_test_features , testRSURFfeat]);

RedChannelPoints_test_PC = testRSURFPoints*coeff_red(:, 1:5);
xlswrite("Red_test_PC", [ years_test , RedChannelPoints_test_PC]);

RedChannelfeat_test_PC = testRSURFfeat*coeff_red_feat(:, 1:5);
xlswrite("Red_test_PC_feat", [ years_test_features , RedChannelfeat_test_PC]);


% unknown
unknownRSURFPoints = getSURFpoints(unknown_R);
xlswrite("Red_unknown", unknownRSURFPoints);

unknownRSURFfeat = getSURFfeatures(unknown_R);
xlswrite("Red_unknown_feat", unknownRSURFfeat);

unknownRSURFPoints_PC = unknownRSURFPoints*coeff_red(:, 1:5);
xlswrite("Red_unknown_PC", unknownRSURFPoints_PC);

unknownRSURFfeat_PC = unknownRSURFfeat*coeff_red_feat(:, 1:5);
xlswrite("Red_unknown_PC_feat", unknownRSURFfeat_PC);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GREEN


% training
RamosMartGSURFPoints = getSURFpoints(RamosMartG);
RiveraGSURFPoints = getSURFpoints(RiveraG);
FridaGSURFPoints = getSURFpoints(FridaG);
AtlGSURFPoints = getSURFpoints(AtlG);
OrozcoGSURFPoints = getSURFpoints(OrozcoG);
VaroGSURFPoints = getSURFpoints(VaroG);
TamayoGSURFPoints = getSURFpoints(TamayoG);
MarinGSURFPoints = getSURFpoints(MarinG);
VasconcelosGSURFPoints = getSURFpoints(VasconcelosG);
RebullGSURFPoints = getSURFpoints(RebullG);


GreenChannelPoints_train = [RamosMartGSURFPoints;  ...
    RiveraGSURFPoints; FridaGSURFPoints; AtlGSURFPoints; ...
    OrozcoGSURFPoints; VaroGSURFPoints; TamayoGSURFPoints;
    VasconcelosGSURFPoints; RebullGSURFPoints; MarinGSURFPoints];

xlswrite("Green_training", [ years_training , GreenChannelPoints_train]);

% Training with features
RamosMartGSURFfeat = getSURFfeatures(RamosMartB);
RiveraGSURFfeat = getSURFfeatures(RiveraG);
FridaGSURFfeat = getSURFfeatures(FridaG);
AtlGSURFfeat = getSURFfeatures(AtlG);
OrozcoGSURFfeat = getSURFfeatures(OrozcoG);
VaroGSURFfeat = getSURFfeatures(VaroG);
TamayoGSURFfeat = getSURFfeatures(TamayoG);
MarinGSURFfeat = getSURFfeatures(MarinG);
VasconcelosGSURFfeat = getSURFfeatures(VasconcelosG);
RebullGSURFfeat = getSURFfeatures(RebullG);


GreenChannelfeat_train = [RamosMartGSURFfeat;  ...
    RiveraGSURFfeat; FridaGSURFfeat; AtlGSURFfeat; ...
    OrozcoGSURFfeat; VaroGSURFfeat; TamayoGSURFfeat;
    VasconcelosGSURFfeat; RebullGSURFfeat; MarinGSURFfeat];

xlswrite("Green_training_feat", [ years_training_features , GreenChannelfeat_train]);


% PCA
coeff_Green = pca(GreenChannelPoints_train);
% we just use the first 5 PC
GreenChannelPoints_train_PC = GreenChannelPoints_train*coeff_Green(:, 1:5);
xlswrite("Green_training_PC", [ years_training , GreenChannelPoints_train_PC]);

coeff_Green_feat = pca(GreenChannelfeat_train);
% we just use the first 5 PC
GreenChannelfeat_train_PC = GreenChannelfeat_train*coeff_Green_feat(:, 1:5);
xlswrite("Green_training_PC_feat", [ years_training_features , GreenChannelfeat_train_PC])

% test
testGSURFPoints = getSURFpoints(test_G);
xlswrite("Green_test", [ years_test , testGSURFPoints]);

testGSURFfeat = getSURFfeatures(test_G);
xlswrite("Green_test_feat", [ years_test_features , testGSURFfeat]);

GreenChannelPoints_test_PC = testGSURFPoints*coeff_Green(:, 1:5);
xlswrite("Green_test_PC", [ years_test , GreenChannelPoints_test_PC]);

GreenChannelfeat_test_PC = testGSURFfeat*coeff_Green_feat(:, 1:5);
xlswrite("Green_test_PC_feat", [ years_test_features , GreenChannelfeat_test_PC]);


% unknown
unknownGSURFPoints = getSURFpoints(unknown_G);
xlswrite("Green_unknown", unknownGSURFPoints);

unknownGSURFfeat = getSURFfeatures(unknown_G);
xlswrite("Green_unknown_feat", unknownGSURFfeat);

unknownGSURFPoints_PC = unknownGSURFPoints*coeff_Green(:, 1:5);
xlswrite("Green_unknown_PC", unknownGSURFPoints_PC);

unknownGSURFfeat_PC = unknownGSURFfeat*coeff_Green_feat(:, 1:5);
xlswrite("Green_unknown_PC_feat", unknownGSURFfeat_PC);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BLUE

% training
RamosMartBSURFPoints = getSURFpoints(RamosMartB);
RiveraBSURFPoints = getSURFpoints(RiveraB);
FridaBSURFPoints = getSURFpoints(FridaB);
AtlBSURFPoints = getSURFpoints(AtlB);
OrozcoBSURFPoints = getSURFpoints(OrozcoB);
VaroBSURFPoints = getSURFpoints(VaroB);
TamayoBSURFPoints = getSURFpoints(TamayoB);
MarinBSURFPoints = getSURFpoints(MarinB);
VasconcelosBSURFPoints = getSURFpoints(VasconcelosB);
RebullBSURFPoints = getSURFpoints(RebullB);


BlueChannelPoints_train = [RamosMartBSURFPoints;  ...
    RiveraBSURFPoints; FridaBSURFPoints; AtlBSURFPoints; ...
    OrozcoBSURFPoints; VaroBSURFPoints; TamayoBSURFPoints;
    VasconcelosBSURFPoints; RebullBSURFPoints; MarinBSURFPoints];

xlswrite("Blue_training", [ years_training , BlueChannelPoints_train]);

% Training with features
RamosMartBSURFfeat = getSURFfeatures(RamosMartR);
RiveraBSURFfeat = getSURFfeatures(RiveraB);
FridaBSURFfeat = getSURFfeatures(FridaB);
AtlBSURFfeat = getSURFfeatures(AtlB);
OrozcoBSURFfeat = getSURFfeatures(OrozcoB);
VaroBSURFfeat = getSURFfeatures(VaroB);
TamayoBSURFfeat = getSURFfeatures(TamayoB);
MarinBSURFfeat = getSURFfeatures(MarinB);
VasconcelosBSURFfeat = getSURFfeatures(VasconcelosB);
RebullBSURFfeat = getSURFfeatures(RebullB);


BlueChannelfeat_train = [RamosMartBSURFfeat;  ...
    RiveraBSURFfeat; FridaBSURFfeat; AtlBSURFfeat; ...
    OrozcoBSURFfeat; VaroBSURFfeat; TamayoBSURFfeat;
    VasconcelosBSURFfeat; RebullBSURFfeat; MarinBSURFfeat];

xlswrite("Blue_training_feat", [ years_training_features , BlueChannelfeat_train]);


% PCA
coeff_Blue = pca(BlueChannelPoints_train);
% we just use the first 5 PC
BlueChannelPoints_train_PC = BlueChannelPoints_train*coeff_Blue(:, 1:5);
xlswrite("Blue_training_PC", [ years_training , BlueChannelPoints_train_PC]);

coeff_Blue_feat = pca(BlueChannelfeat_train);
% we just use the first 5 PC
BlueChannelfeat_train_PC = BlueChannelfeat_train*coeff_Blue_feat(:, 1:5);
xlswrite("Blue_training_PC_feat", [ years_training_features , BlueChannelfeat_train_PC])

% test
testBSURFPoints = getSURFpoints(test_B);
xlswrite("Blue_test", [ years_test , testBSURFPoints]);

testBSURFfeat = getSURFfeatures(test_B);
xlswrite("Blue_test_feat", [ years_test_features , testBSURFfeat]);

BlueChannelPoints_test_PC = testBSURFPoints*coeff_Blue(:, 1:5);
xlswrite("Blue_test_PC", [ years_test , BlueChannelPoints_test_PC]);

BlueChannelfeat_test_PC = testBSURFfeat*coeff_Blue_feat(:, 1:5);
xlswrite("Blue_test_PC_feat", [ years_test_features , BlueChannelfeat_test_PC]);


% unknown
unknownBSURFPoints = getSURFpoints(unknown_B);
xlswrite("Blue_unknown", unknownBSURFPoints);

unknownBSURFfeat = getSURFfeatures(unknown_B);
xlswrite("Blue_unknown_feat", unknownBSURFfeat);

unknownBSURFPoints_PC = unknownBSURFPoints*coeff_Blue(:, 1:5);
xlswrite("Blue_unknown_PC", unknownBSURFPoints_PC);

unknownBSURFfeat_PC = unknownBSURFfeat*coeff_Blue_feat(:, 1:5);
xlswrite("Blue_unknown_PC_feat", unknownBSURFfeat_PC);
toc()