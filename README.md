# CompStats-GPforArtHistory

This is a repository for the final project for Computational Statistics (MA 6973, MATH 2080) at NYU with Mike O'Neil. In this project we'll explore the application of GP with different kernels. The input data are SURF descriptors from paintings from Mexican artists. These artists are:

 - Alfredo Ramos Martinez
 - Diego Rivera
 - Frida Kahlo
 - Dr Atl (Gerardo Murillo)
 - Jose Clemente Orozco
 - Remedios Varo
 - Rufino Tamayo
 - Javier Marin
 - José María Vasconcelos
 - Santiago Rebull

 The functions in this project are:
 
 - Generate_data.m : this is a script to generate data for the different color channels (Red, Green, Blue) from SURF points, SURF descriptors, SURF points using PCA, and SURF descriptors using PCA. In order to run this scrip the user needs to download the data (https://drive.google.com/file/d/1vtyYOY6eRWRXMgH_ZeJDBHVc5MPrsgiF/view?usp=sharing). Running this script takes some time, so if the user doesn't wish to run it, all the variables that arise from running it are in generated_data_variables.mat . Therefore if the user wants to explore this variables, just call "load generated_data_variables.mat".
 - readImagesChannels.m : this is a function that is used in Generate_data.m to read all the images on different folders and separate them by color channel
 - readImagesChannels_new.m : this is a function that is used in Generate_data.m to read the test set and separate the pictures by color channel
 - getSURFpoints.m : calculates the top 4 SURF points' characterists (location, metric, scale, sign of laplacian) and puts all this information in a vector.
 - getSURFfeatures.m : extracts SURF descriptors for the most important 4 SURF points
 - fitDiff_stats.m : fits different gaussian regressions with different kernels and optimization techniques, and outputs a table with information about the fit (error_L2_train, error_Linf_train, error_average_train, max_interval_length_train, interval_length_average_train, which_worse_train, percentage_lowerError_mean_train, error_L2_test, error_Linf_test, error_average_test, max_interval_length_test, interval_length_average_test, which_worse_test, percentage_lowerError_mean_test, time_taken)
 - plotEstimatedSURFpoints.m : plots the top SURF points on a painting
 - GP_analysis.m : this is the final script to make conclusions. It uses fitDiff_stats.m with the different methods of information extraction from Generate_data.m and produces tables with information about the different fits. This is extremely slow so if the user doesn't want to run this but want to explore the variables generated, they can be found on GP_analysis_variables.mat so just call "GP_analysis_variables.mat" to explore them.
 
 
 
Most of the data and idea comes from Mariana Martinez's undegraduate thesis which can be found here: https://drive.google.com/file/d/1qcijLmFHaO14YUyFAXb8tquHLi15eWBV/view?usp=sharing . An abstract of such work in English can be found here: https://drive.google.com/file/d/1ME1wgtvle-0SLcirI48rROM7mg99MBmL/view?usp=sharing .
 
