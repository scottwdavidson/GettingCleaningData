## GettingCleaningData Final Project
Project Repo for the Getting / Cleaning Data Final Project

### Overview
This repository holds the code (run_anlaysis.R) and cook book for the final project of the Coursera Getting / Cleaning Data final project. 

### Project Requirements (verbatim from instructors - good luck understanding them on first read ;-))
You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

### Approach (as codified in run_analysis.R for the most part)
1. Read the zipped file from here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip
3. Merge the test / training subject data
4. Merge the test / training activity data (title "y") and then apply the provided labels.
5. Merge the test / training measurement data (title "x")
6. Read the feature data (which are the column headers for the measurement data) and apply it as column headers to the measurement data. 
7. Combine all the different data sets together.
8. Subset out only measurement data w/ "mean" and "std" in the column name.
9. Compute the mean of the data grouped by the subject and activity.
10. Write out the final results (and attach it to the final project submission).
