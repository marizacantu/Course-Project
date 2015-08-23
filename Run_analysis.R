featuresNames <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/features.txt")

#read training data
subjectTrain <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
 
#read test data
X_test <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#Combine the training and testing sets.  Merge data set in subject, actvity and features
subject <- rbind(subjectTrain, subject_test)
activity <- rbind(activityTrain, y_test)
features <- rbind(featuresTrain, X_test)

#PART 2
#Column names
colnames(features) <- t(featuresNames[2])

#Complete merge in complete_data
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)

#Extracting only measurements on the mean and std deviation for each measurement
columnsWithMeanSTD <- grep(filespath, names(complete_data), ignore.case=TRUE)

#complete dimension of complete_data
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
dim(complete_data)
extractedData <- complete_data[requiredColumns]

dim(extractedData)

#PART 3 Descriptive names
activity_labels <- read.table("C:/Users/Mariza/Documents/Cursos/Especialización estadística/Getting and cleaning data/UCI HAR Dataset/activity_labels.txt")
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
extractedData$Activity[extractedData$Activity == i] <- as.character(activity_labels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)

#Part 4 Descriptive variable names
names(extractedData)

 
#Part 5  Create a tidy data
extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)

tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
