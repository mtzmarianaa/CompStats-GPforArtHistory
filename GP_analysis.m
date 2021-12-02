clear all
close all
clc

% Script to analyse GP for generated SURF data
% read training data
Red_training = table2array(readtable("Generated_data/Red_training.csv"));
Green_training = table2array(readtable("Generated_data/Green_training.csv"));
Blue_training = table2array(readtable("Generated_data/Blue_training.csv"));

Red_training_PC = table2array(readtable("Generated_data/Red_training_PC.csv"));
Green_training_PC = table2array(readtable("Generated_data/Green_training_PC.csv"));
Blue_training_PC = table2array(readtable("Generated_data/Blue_training_PC.csv"));

% read testing known data
Red_test = table2array(readtable("Generated_data/Red_test.csv"));
Green_test = table2array(readtable("Generated_data/Green_test.csv"));
Blue_test = table2array(readtable("Generated_data/Blue_test.csv"));

Red_test_PC = table2array(readtable("Generated_data/Red_test_PC.csv"));
Green_test_PC = table2array(readtable("Generated_data/Green_test_PC.csv"));
Blue_test_PC = table2array(readtable("Generated_data/Blue_test_PC.csv"));

% read testing unknown data
Red_unknown = table2array(readtable("Generated_data/Red_unknown.csv"));
Green_unknown = table2array(readtable("Generated_data/Green_unknown.csv"));
Blue_unknown = table2array(readtable("Generated_data/Blue_unknown.csv"));

Red_unknown_PC = table2array(readtable("Generated_data/Red_unknown_PC.csv"));
Green_unknown_PC = table2array(readtable("Generated_data/Green_unknown_PC.csv"));
Blue_unknown_PC = table2array(readtable("Generated_data/Blue_unknown_PC.csv"));

T_red = analysis_GP_channel(Red_training(:, 2:21), Red_training(:, 1), ...
    Red_test(:, 2:21), Red_test(:, 1));
Table_red = array2table(T_red, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});

T_green = analysis_GP_channel(Green_training(:, 2:21), Green_training(:, 1), ...
    Green_test(:, 2:21), Green_test(:, 1));
Table_green = array2table(T_green, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});


T_blue = analysis_GP_channel(Blue_training(:, 2:21), Blue_training(:, 1), ...
    Blue_test(:, 2:21), Blue_test(:, 1));
Table_blue = array2table(T_blue, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});

Table_red
Table_green
Table_blue


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% As we can see this is bullshit, maybe dimensionality problems?

T_red_PC = analysis_GP_channel(Red_training_PC(:, 2:6), Red_training_PC(:, 1), ...
    Red_test_PC(:, 2:6), Red_test_PC(:, 1));
Table_red_PC = array2table(T_red, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});

T_green_PC = analysis_GP_channel(Green_training_PC(:, 2:6), Green_training_PC(:, 1), ...
    Green_test_PC(:, 2:6), Green_test_PC(:, 1));
Table_green_PC = array2table(T_green, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});


T_blue_PC = analysis_GP_channel(Blue_training_PC(:, 2:6), Blue_training_PC(:, 1), ...
    Blue_test_PC(:, 2:6), Blue_test_PC(:, 1));
Table_blue_PC = array2table(T_blue, 'VariableNames', {'error_L2_train', ...
    'error_Linf_train', 'max_interval_length_train', 'error_L2_test', ..., 
    'error_Linf_test', 'max_interval_length_test', 'time_taken'});

Table_red_PC
Table_green_PC
Table_blue_PC