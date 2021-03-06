% Script to obtain the SURF vectors

% We read the images
tic
[RamosMartR,RamosMartG, RamosMartB, MeridaR, MeridaG, ...
    MeridaB, RiveraR, RiveraG, RiveraB, FridaR, FridaG, ...
    FridaB, AtlR, AtlG, AtlB, OrozcoR, OrozcoG, OrozcoB, CarringtonR, ...
    CarringtonG, CarringtonB, IzquierdoR,IzquierdoG, IzquierdoB, ...
    VaroR, VaroG, VaroB, TamayoR, TamayoG, TamayoB ] = readImagesChannels();
toc

% We read the paintins' metadata

METAD = readtable("Paintings_metadata_general.csv");

% For each channel (red, green, blue) we get the SURF descriptors

% RED
tic()
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



% GREEN
tic()
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

% BLUE
tic()
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
toc()

xlswrite("RamosMartSURF", RamosMartFeat);
xlswrite("MeridaSURF", MeridaFeat);
xlswrite("RiveraSURF", RiveraFeat);
xlswrite("FridaSURF", FridaFeat);
xlswrite("AtlSURF", AtlFeat);
xlswrite("OrozcoSURF", OrozcoFeat);
xlswrite("CarringtonSURF", CarringtonFeat);
xlswrite("IzquierdoSURF", IzquierdoFeat);
xlswrite("VaroSURF", VaroFeat);
xlswrite("TamayoSURF", TamayoFeat);



% Vamos a hacer un ejemplo y graficar sus 10 puntos mas interesantes

I = rgb2gray(imread('DataObrasDeArte/LeonoraCarrington/CarringtonBirthBath.jpg'));
puntosEjem = detectSURFFeatures(I);
imshow(I); hold on;
plot(puntosEjem.selectStrongest(10))