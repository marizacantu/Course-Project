# Course-Project
Tidy Data

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variable codebook

activity_labels = take values from activity_labels.txt
featuresNames = take values from features.txt

subjectTrain = take values from subject_train.txt
activityTrain = take values from y_train.txt
featuresTrain = take values from x_train.txt

X_test = take values from x_test.txt
y_test = take values from y_test.txt
subject_test = take values from subject_test.txt

subject = merge subjectTrain and subject_test
activity = merge activityTrain and y_test
features = merge featuresTrain and x_test

complete_data = merge subject, activity and features

columnsWithMeanSTD = calculate cases with mean and standar deviation
requiere columns = let see the complete dimension complete_data

tidyData = let create a tidy.txt
