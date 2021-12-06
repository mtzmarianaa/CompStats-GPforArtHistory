clear all
close all
clc

tic()
% Script to analyse GP for generated SURF data after data has been
% generated. If you don't want to generate the data,
% generated_data_variables.mat includes all the variables saved after
% running Generate_data.m
% read training data
Red_training = table2array(readtable("Generated_data/Red_training.csv"));
Green_training = table2array(readtable("Generated_data/Green_training.csv"));
Blue_training = table2array(readtable("Generated_data/Blue_training.csv"));

Red_training_feat = table2array(readtable("Generated_data/Red_training_feat.csv"));
Green_training_feat = table2array(readtable("Generated_data/Green_training_feat.csv"));
Blue_training_feat = table2array(readtable("Generated_data/Blue_training_feat.csv"));

Red_training_PC = table2array(readtable("Generated_data/Red_training_PC.csv"));
Green_training_PC = table2array(readtable("Generated_data/Green_training_PC.csv"));
Blue_training_PC = table2array(readtable("Generated_data/Blue_training_PC.csv"));

Red_training_PC_feat = table2array(readtable("Generated_data/Red_training_PC_feat.csv"));
Green_training_PC_feat = table2array(readtable("Generated_data/Green_training_PC_feat.csv"));
Blue_training_PC_feat = table2array(readtable("Generated_data/Blue_training_PC_feat.csv"));

% read testing known data (if already generated)
Red_test = table2array(readtable("Generated_data/Red_test.csv"));
Green_test = table2array(readtable("Generated_data/Green_test.csv"));
Blue_test = table2array(readtable("Generated_data/Blue_test.csv"));

Red_test_feat = table2array(readtable("Generated_data/Red_test_feat.csv"));
Green_test_feat = table2array(readtable("Generated_data/Green_test_feat.csv"));
Blue_test_feat = table2array(readtable("Generated_data/Blue_test_feat.csv"));

Red_test_PC = table2array(readtable("Generated_data/Red_test_PC.csv"));
Green_test_PC = table2array(readtable("Generated_data/Green_test_PC.csv"));
Blue_test_PC = table2array(readtable("Generated_data/Blue_test_PC.csv"));

Red_test_PC_feat = table2array(readtable("Generated_data/Red_test_PC_feat.csv"));
Green_test_PC_feat = table2array(readtable("Generated_data/Green_test_PC_feat.csv"));
Blue_test_PC_feat = table2array(readtable("Generated_data/Blue_test_PC_feat.csv"));

% read testing unknown data (if already generated)
Red_unknown = table2array(readtable("Generated_data/Red_unknown.csv"));
Green_unknown = table2array(readtable("Generated_data/Green_unknown.csv"));
Blue_unknown = table2array(readtable("Generated_data/Blue_unknown.csv"));

Red_unknown_feat = table2array(readtable("Generated_data/Red_unknown_feat.csv"));
Green_unknown_feat = table2array(readtable("Generated_data/Green_unknown_feat.csv"));
Blue_unknown_feat = table2array(readtable("Generated_data/Blue_unknown_feat.csv"));

Red_unknown_PC = table2array(readtable("Generated_data/Red_unknown_PC.csv"));
Green_unknown_PC = table2array(readtable("Generated_data/Green_unknown_PC.csv"));
Blue_unknown_PC = table2array(readtable("Generated_data/Blue_unknown_PC.csv"));

Red_unknown_PC_feat = table2array(readtable("Generated_data/Red_unknown_PC_feat.csv"));
Green_unknown_PC_feat = table2array(readtable("Generated_data/Green_unknown_PC_feat.csv"));
Blue_unknown_PC_feat = table2array(readtable("Generated_data/Blue_unknown_PC_feat.csv"));



[T_red, problems_red_train, ...
    problems_red_test] = analysis_GP_channel(Red_training(:, 2:21), Red_training(:, 1), ...
    Red_test(:, 2:21), Red_test(:, 1)) ;
Table_red = array2table(T_red, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});

[T_green, problems_green_train, ...
    problems_green_test] = analysis_GP_channel(Green_training(:, 2:21), Green_training(:, 1), ...
    Green_test(:, 2:21), Green_test(:, 1));
Table_green = array2table(T_green, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


[T_blue, problems_blue_train, ...
    problems_blue_test] = analysis_GP_channel(Blue_training(:, 2:21), Blue_training(:, 1), ...
    Blue_test(:, 2:21), Blue_test(:, 1));
Table_blue = array2table(T_blue, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% As we can see this is bullshit, maybe dimensionality problems?

[T_red_PC, problems_redPC_train, ...
    problems_redPC_test] = analysis_GP_channel(Red_training_PC(:, 2:6), Red_training_PC(:, 1), ...
    Red_test_PC(:, 2:6), Red_test_PC(:, 1));
Table_red_PC = array2table(T_red_PC, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});

[T_green_PC, problems_greenPC_train, ...
    problems_greenPC_test] = analysis_GP_channel(Green_training_PC(:, 2:6), Green_training_PC(:, 1), ...
    Green_test_PC(:, 2:6), Green_test_PC(:, 1));
Table_green_PC = array2table(T_green_PC, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


[T_blue_PC, problems_bluePC_train, ...
    problems_bluePC_test] = analysis_GP_channel(Blue_training_PC(:, 2:6), Blue_training_PC(:, 1), ...
    Blue_test_PC(:, 2:6), Blue_test_PC(:, 1));
Table_blue_PC = array2table(T_blue_PC, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Still horrible, we use SURF features instead
% Notice that since we have 4 surf features per painting, if we want to
% know the problematic (wrongly classified) paintings, we need to divide
% the result by 4 and apply the ceiling function

[T_red_feat, problems_redfeat_train, ...
    problems_redfeat_test] = analysis_GP_channel(Red_training_feat ...
    (:, 2:65), Red_training_feat(:, 1), ...
    Red_test_feat(:, 2:65), Red_test_feat(:, 1));
T_red_feat(:, 6) = ceil(T_red_feat(:, 6)./4); 
T_red_feat(:, 13) = ceil(T_red_feat(:, 13)./4); 
Table_red_feat = array2table(T_red_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});

[T_green_feat, problems_greenfeat_train, ...
    problems_greenfeat_test]  = analysis_GP_channel(Green_training_feat(:, 2:65), Green_training_feat(:, 1), ...
    Green_test_feat(:, 2:65), Green_test_feat(:, 1));
T_green_feat(:, 6) = ceil(T_green_feat(:, 6)./4); 
T_green_feat(:, 13) = ceil(T_green_feat(:, 13)./4); 
Table_green_feat = array2table(T_green_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


[T_blue_feat, problems_bluefeat_train, ...
    problems_bluefeat_test]  = analysis_GP_channel(Blue_training_feat(:, 2:65), Blue_training_feat(:, 1), ...
    Blue_test_feat(:, 2:65), Blue_test_feat(:, 1));
T_blue_feat(:, 6) = ceil(T_blue_feat(:, 6)./4); 
T_blue_feat(:, 13) = ceil(T_blue_feat(:, 13)./4); 
Table_blue_feat = array2table(T_blue_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% As we can see this is bullshit, maybe dimensionality problems?

[T_red_PC_feat, problems_redfeatPC_train, ...
    problems_redfeatPC_test]  = analysis_GP_channel(Red_training_PC_feat(:, 2:6), Red_training_PC_feat(:, 1), ...
    Red_test_PC_feat(:, 2:6), Red_test_PC_feat(:, 1));
T_red_PC_feat(:, 6) = ceil(T_red_PC_feat(:, 6)./4); 
T_red_PC_feat(:, 13) = ceil(T_red_PC_feat(:, 13)./4); 
Table_red_PC_feat = array2table(T_red_PC_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});

[T_green_PC_feat, problems_greenfeatPC_train, ...
    problems_greenfeatPC_test]  = analysis_GP_channel(Green_training_PC_feat(:, 2:6), Green_training_PC_feat(:, 1), ...
    Green_test_PC_feat(:, 2:6), Green_test_PC_feat(:, 1));
T_green_PC_feat(:, 6) = ceil(T_green_PC_feat(:, 6)./4); 
T_green_PC_feat(:, 13) = ceil(T_green_PC_feat(:, 13)./4); 
Table_green_PC_feat = array2table(T_green_PC_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


[T_blue_PC_feat, problems_bluefeatPC_train, ...
    problems_bluefeatPC_test]  = analysis_GP_channel(Blue_training_PC_feat(:, 2:6), Blue_training_PC_feat(:, 1), ...
    Blue_test_PC_feat(:, 2:6), Blue_test_PC_feat(:, 1));
T_blue_PC_feat(:, 6) = ceil(T_blue_PC_feat(:, 6)./4); 
T_blue_PC_feat(:, 13) = ceil(T_blue_PC_feat(:, 13)./4); 
Table_blue_PC_feat = array2table(T_blue_PC_feat, 'VariableNames', {'error_L2_train',...
    'error_Linf_train', 'error_average_train', ...
    'max_interval_length_train', 'interval_length_average_train', 'which_worse_train', ...
    'percentage_lowerError_mean_train', 'error_L2_test', 'error_Linf_test', 'error_average_test', ...
    'max_interval_length_test', 'interval_length_average_test', 'which_worse_test',...
    'percentage_lowerError_mean_test', 'time_taken'});


toc()

'SURF points'
Table_red
%xlswrite('Table_red_SURF.csv', T_red)
Table_green
%xlswrite('Table_green_SURF.csv', T_green)
Table_blue
%xlswrite('Table_blue_SURF.csv', T_blue)

'SURF points with PC'
Table_red_PC
%xlswrite('Table_redPC_SURF.csv', T_red_PC)
Table_green_PC
%xlswrite('Table_greenPC_SURF.csv', T_green_PC)
Table_blue_PC
%xlswrite('Table_bluePC_SURF.csv', T_blue_PC)

'SURF features'
Table_red_feat
%xlswrite('Table_red_feat.csv', T_red_feat)
Table_green_feat
%xlswrite('Table_green_feat.csv', T_green_feat)
Table_blue_feat
%xlswrite('Table_blue_feat.csv', T_blue_feat)

'SURF features with PC'
Table_red_PC_feat
%xlswrite('Table_redPC_feat.csv', T_red_PC_feat)
Table_green_PC_feat
%xlswrite('Table_greenPC_feat.csv', T_green_PC_feat)
Table_blue_PC_feat
%xlswrite('Table_bluePC_feat.csv', T_blue_PC_feat)



