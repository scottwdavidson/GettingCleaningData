## Codebook
### Subject Data Interpretation
Subjects were simplied identified by a number and there was no transposition of these values into anything more meaningful.

### Activity Data Interpretation
In the experiments each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
and each of the values were encoded w/ values (1:6) in the collected raw data. 

1. **Walking**: encoded as value 1 or WALKING (in the label file)
2. **Walking Upstairs**: encoded as value 2 or WALKING_UPSTAIRS (in the label file)
3. **Walking Downstairs**: encoded as value 3 or WALKING_DOWNSTAIRS (in the label file)
4. **Sitting**: encoded as value 4 or SITTING (in the label file)
5. **Standing**: encoded as value 5 or STANDING (in the label file)
6. **Laying**: encoded as value 6 or LAYING (in the label file)

Using the smartphone's embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity data was captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data, and 30% were used for the test data.

### Provide Data Files:
The dataset includes the following files:

* **README.txt**: study information and license documentation 
* **features_info.txt**: Shows information about the variables used on the feature vector 
* **features.txt**: List of all features 
* **activity_labels**.txt: Links the class labels with their activity name 
* **train/X_train.txt**: Training set (referred to as Measurements in code)
* **train/y_train.txt**: Training labels (referred to as Activities in code)
* **test/X_test.txt**: Test set (referred to as Measurements in code)
* **test/y_test.txt**: Test labels (referred to as Activities in code)

### Cleaning and Normalizing Data
The R script 'run_analysis.R' initially combines all of the original datasets into a single data table and then extracts a subset based on mean and standard deviation measurements.
The following steps summarize the algorithm underlying *run_analysis.R*:

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
