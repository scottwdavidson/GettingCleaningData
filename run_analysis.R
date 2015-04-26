## ************************************************************************************************
## Getting and Cleaning Data Course Project
## Here's the assignment:
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##    each variable for each activity and each subject.
## ************************************************************************************************
run_analysis <- function() {
    
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    ## STEP 1 - Merge traing/test
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*

    ## Read in SUBJECT data for both training and test, bind them and add column name
    SUBJECT_COLUMN_NAME = "Subject"
    trainingSubjects = read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    testSubjects = read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    subjects = rbind(trainingSubjects, testSubjects)  
    colnames(subjects) = SUBJECT_COLUMN_NAME
    
    ## Read in ACTIVITY data for both training and test, bind them and add column name
    ACTIVITY_COLUMN_NAME = "Activity"
    trainingActivities = read.table("./data/UCI HAR Dataset/train/y_train.txt")
    testActivities = read.table("./data/UCI HAR Dataset/test/y_test.txt")
    activities = rbind(trainingActivities, testActivities)      
    colnames(activities) = ACTIVITY_COLUMN_NAME

    ## Read in ACTIVITY LABELS
    ##
    ## Note: activity labels has an index column, so we'll use the 2nd column for the values
    activityLabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")
    
    ## Merge (replace) the numeric values of the activity data w/ the label
    ##
    ## Note: this is STEP 3 from the instructions (replacing the (1:6) w/ actual activity names)
    activities = merge(activities, activityLabels, by=1)[,2]
    
    ## Read in MEASUREMENT data for both training and test and bind them
    MEASUREMENT_COLUMN_NAME = "Measurement"
    trainingMeasurements = read.table("./data/UCI HAR Dataset/train/X_train.txt")
    testMeasurements = read.table("./data/UCI HAR Dataset/test/X_test.txt")
    measurements = rbind(trainingMeasurements, testMeasurements)
    
    ## Read in FEATURE data (column headings for measurements)
    features = read.table("./data/UCI HAR Dataset/features.txt")
    
    ## Add column names for measurements (from feature data)
    ##
    ## Note: feature data table has an index column, so we'll actually take it's 2nd column for the names
    ## Note: this is STEP 4 from the instructions (labelling the data set w/ the feature names)
    colnames(measurements) = features[,2]   
    
    ## Combine all of the data (using cbind)
    fullDataset = cbind(subjects, activities, measurements)
    
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    ## STEP 2 - Extract only the measurements on the mean and standard deviation
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    
    ## Extract out the subject, activity and mean/standard deviation columns into it's own data frame
    meanStd = fullDataset[,c(1,2,grep("mean|std",colnames(fullDataset)))]
    
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    ## STEP 3 - Uses descriptive activity names to name the activities in the data set
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    
    ## Note - step 3 is already done above (see note)
    ## Note - step 4 is already done above (see note)
    
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    ## STEP 5 - Uses descriptive activity names to name the activities in the data set
    ##-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*-----*
    
    ## Using melt, prepare the meanStd to computes means
    meltedMeanStd = melt(meanStd, id.var = c(SUBJECT_COLUMN_NAME, 'activities'))
    results = dcast(meltedMeanStd , Subject + activities ~ variable, mean)
    
    ## Write the results to the file system
    write.table(results, file="FinalData.txt", row.names = FALSE)
}
