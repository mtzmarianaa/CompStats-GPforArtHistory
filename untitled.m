% Script to obtain the SURF vectors

% We read the images
tic
[RamosMartR,RamosMartG, RamosMartB, MeridaR,MeridaG, MeridaB, RiveraR, RiveraG, RiveraB, FridaR, FridaG, FridaB, AtlR, AtlG, AtlB, OrozcoR, OrozcoG, OrozcoB, CarringtonR, CarringtonG, CarringtonB, IzquierdoR,IzquierdoG, IzquierdoB, VaroR, VaroG, VaroB, TamayoR, TamayoG, TamayoB ] = readImagesChannels();
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

RedChannelPoints = [RamosMartRSURFPoints; MeridaRSURFPoints; RiveraRSURFPoints; FridaRSURFPoints; AtlRSURFPoints; OrozcoRSURFPoints; CarringtonRSURFPoints; IzquierdoRSURFPoints; VaroRSURFPoints; TamayoRSURFPoints];
%Perform PCA on the red channel SURF points
pcaR = pca(RedChannelPoints);
% Get the first principal component so we can plot this
figure(1)
PC_1 = RedChannelPoints*pcaR(:,1);
scatter(table2array(METAD(:, 'Year')), PC_1)
% The second one
figure(2)
PC_2 = RedChannelPoints*pcaR(:,2);
scatter(table2array(METAD(:, 'Year')), PC_2)
% The third one
figure(3)
PC_3 = RedChannelPoints*pcaR(:,3);
scatter(table2array(METAD(:, 'Year')), PC_3)

toc()

% GP

NaiveGP = fitrgp(RedChannelPoints, table2array(METAD(:, 'Year')));
Years_Exp = linspace(1890, 2020, 130)';
[SURFpred1,~,SURFint1] = predict(NaiveGP,Years_Exp);
% DO PCA
PC_1_pred = RedChannelPoints*pcaR(:,1);
PC_2_pred = RedChannelPoints*pcaR(:,2);
PC_3_pred = RedChannelPoints*pcaR(:,3);

scatter(x_observed,y_observed2,'xr') % Observed data points
fplot(@(x) x.*sin(x),[0,10],'--r')   % Function plot of x*sin(x)
plot(x,ypred2,'g')                   % GPR predictions
patch([x;flipud(x)],[yint2(:,1);flipud(yint2(:,2))],'k','FaceAlpha',0.1); % Prediction intervals
hold off
title('GPR Fit of Noisy Observations')
legend({'Noisy observations','g(x) = x*sin(x)','GPR predictions','95% prediction intervals'},'Location','best')


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



toc()


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