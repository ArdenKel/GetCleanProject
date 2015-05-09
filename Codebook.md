---
title: "Codebook template"
author: Michal Rutkowski
date: 9 May 2015

---
 
## Project Description
This project was to tidy the data from this given study
 
##Data source
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
 

 
##Creating the tidy datafile
 1. Download the data, placing its main directory (renamed Dataset) with the script in a directory.
 2. Run the script
 3. You get a file "large_data.txt" containing the full data on variables concerning means and standard deviations
 4. You also get a file "tidyData.txt" with the abbreviated data - averaged over each subject-activity pair 

###Cleaning of the data
The script:
1. Loads training and test data, along with activity codes and subject identifiers
2. Combines the two sets
3. Crops data containing variables that are not means or standard deviations based on variable names
4. Names the variables according to the codes of "features.txt"
5. Pastes together subject ids, activity names and data
6. Outputs the resulting dataframe as "large_data.txt"
7. Averages the dataset over activity - subject pairs
8. Outputs the shorter dataframe as "tidyData.txt"

 
##Variables in tidyData.txt:
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
 
### Variable 1 - Activity (tidyData[,1])
factor with values Laying; Sitting; Standing; Walking; WalkingDownstairs; WalkingUpstairs
Represents the activity performed during measurement

### Variable 1 - Subject (tidyData[,2])
factor with values 1:30
Represents the identity of the test subject

###Variables 3-68
numeric, named in the scheme:

 a) first letter t or f denotes whether the datum is taken from time-variance or frequency variance

 b) Subsequent part names the measurement, one of:

 - BodyAcc - accelerometer signal due to movement
 - GravityAcc - accelerometer signal due to gravity
 - BodyAccJerk - accelerometer jerk signal
 - BodyGyro - gyroscope signal
 - BodyGyroJerk gyroscope jerk signal
 
 c) if Mag follows the name of the quantity - it denotes the magnitue of the vector

 d) mean() or std() - mean or standard deviation

 e) if the quantity is not Mag-type (see c)) X,Y, or Z - which axis is concerned
 
##Sources

