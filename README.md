# GetCleanProject
Course Project repo for Getting and Cleaning Data - how to use the script

1. Unzip the data in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and call the main unzipped directory "Dataset"
2. Place the run_analysis.R script in the same directory as Dataset
3. run the script in R/RStudio
4. find in the workong directory 2 new files:
 - large_data.txt containing the dataset before averaging over subjects and activities
 - tidyData.txt containing the data after averaging
5. use read.table() in R to read in the file you need
