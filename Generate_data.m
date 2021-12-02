% Script to obtain the SURF vectors
tic()
% We read the images

% training data
[RamosMartR,RamosMartG, RamosMartB, MeridaR, MeridaG, ...
    MeridaB, RiveraR, RiveraG, RiveraB, FridaR, FridaG, ...
    FridaB, AtlR, AtlG, AtlB, OrozcoR, OrozcoG, OrozcoB, CarringtonR, ...
    CarringtonG, CarringtonB, IzquierdoR,IzquierdoG, IzquierdoB, ...
    VaroR, VaroG, VaroB, TamayoR, TamayoG, TamayoB ] = readImagesChannels();
% test data
[test_R, test_G, test_B] = readImagesChannels_new('Test_set_known');
% unknown dates data
[unknown_R, unknown_G, unknown_B] = readImagesChannels_new('Test_set_unknown');

% We read the paintins' metadata
% training
METAD = readtable("Paintings_metadata_general.csv");
years_training = METAD{:, 'Year'};
% test
METAD_test = readtable("Paintings_metadata_test.csv");
years_test = METAD_test{:, 'Year'};

% For each channel (red, green, blue) we get the SURF descriptors

% RED

% training
RamosMartRSURFPoints = getSURFpoints(RamosMartR);
MeridaRSURFPoints = getSURFpoints(MeridaR);
RiveraRSURFPoints = getSURFpoints(RiveraR);
FridaRSURFPoints = getSURFpoints(FridaR);
AtlRSURFPoints = getSURFpoints(AtlR);
OrozcoRSURFPoints = getSURFpoints(OrozcoR);
CarringtonRSURFPoints = getSURFpoints(CarringtonR);
IzquierdoRSURFPoints = getSURFpoints(IzquierdoR);
VaroRSURFPoints = getSURFpoints(VaroR);
TamayoRSURFPoints = getSURFpoints(TamayoR);


RedChannelPoints_train = [RamosMartRSURFPoints; MeridaRSURFPoints; ...
    RiveraRSURFPoints; FridaRSURFPoints; AtlRSURFPoints; ...
    OrozcoRSURFPoints; CarringtonRSURFPoints; ...
    IzquierdoRSURFPoints; VaroRSURFPoints; TamayoRSURFPoints];

xlswrite("Red_training", [ years_training , RedChannelPoints_train]);

% test
testRSURFPoints = getSURFpoints(test_R);
xlswrite("Red_test", [ years_test , testRSURFPoints]);

% unknown
unknownRSURFPoints = getSURFpoints(unknown_R);
xlswrite("Red_unknown", unknownRSURFPoints);

% GREEN

RamosMartGSURFPoints = getSURFpoints(RamosMartG);
MeridaGSURFPoints = getSURFpoints(MeridaG);
RiveraGSURFPoints = getSURFpoints(RiveraG);
FridaGSURFPoints = getSURFpoints(FridaG);
AtlGSURFPoints = getSURFpoints(AtlG);
OrozcoGSURFPoints = getSURFpoints(OrozcoG);
CarringtonGSURFPoints = getSURFpoints(CarringtonG);
IzquierdoGSURFPoints = getSURFpoints(IzquierdoG);
VaroGSURFPoints = getSURFpoints(VaroG);
TamayoGSURFPoints = getSURFpoints(TamayoG);

GreenChannelPoints_train = [RamosMartGSURFPoints; MeridaGSURFPoints; ...
    RiveraGSURFPoints; FridaGSURFPoints; AtlGSURFPoints; ...
    OrozcoGSURFPoints; CarringtonGSURFPoints; ...
    IzquierdoGSURFPoints; VaroGSURFPoints; TamayoGSURFPoints];

xlswrite("Green_training", [ years_training , GreenChannelPoints_train]);

% test
testGSURFPoints = getSURFpoints(test_G);
xlswrite("Green_test", [ years_test , testGSURFPoints]);

% unknown
unknownGSURFPoints = getSURFpoints(unknown_G);
xlswrite("Green_unknown", unknownGSURFPoints);

% BLUE

RamosMartBSURFPoints = getSURFpoints(RamosMartB);
MeridaBSURFPoints = getSURFpoints(MeridaB);
RiveraBSURFPoints = getSURFpoints(RiveraB);
FridaBSURFPoints = getSURFpoints(FridaB);
AtlBSURFPoints = getSURFpoints(AtlB);
OrozcoBSURFPoints = getSURFpoints(OrozcoB);
CarringtonBSURFPoints = getSURFpoints(CarringtonB);
IzquierdoBSURFPoints = getSURFpoints(IzquierdoB);
VaroBSURFPoints = getSURFpoints(VaroB);
TamayoBSURFPoints = getSURFpoints(TamayoB);


BlueChannelPoints_train = [RamosMartBSURFPoints; MeridaBSURFPoints; ...
    RiveraBSURFPoints; FridaBSURFPoints; AtlBSURFPoints; ...
    OrozcoBSURFPoints; CarringtonBSURFPoints; ...
    IzquierdoBSURFPoints; VaroBSURFPoints; TamayoBSURFPoints];

xlswrite("Blue_training", [ years_training , BlueChannelPoints_train]);

% test
testBSURFPoints = getSURFpoints(test_B);
xlswrite("Blue_test", [ years_test , testBSURFPoints]);

% unknown
unknownBSURFPoints = getSURFpoints(unknown_B);
xlswrite("Blue_unknown", unknownBSURFPoints);
toc()