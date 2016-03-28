## run_analysis.R

## libraries to load
library(dplyr)

## functions
getActivity <- function(x) {activityLabels[x]}

## Get labels and id's used in both test and train datasets
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"))
featureLabels  <- read.table(file.path("UCI HAR Dataset", "features.txt"))
activityLabels <- unlist(activityLabels$V2)
featureLabels <-tolower( unlist( gsub("(\\()|(\\))|-|,", "", featureLabels$V2) ) )

## Get parts of the testDataSet
rawTestData    <- read.table(file.path( "UCI HAR Dataset", "test","X_test.txt"))
subjectTestID  <- read.table(file.path( "UCI HAR Dataset", "test","subject_test.txt"))
activityTestID <- read.table(file.path( "UCI HAR Dataset", "test","y_test.txt"))

## Construct testDataSet
activityTest <- sapply(activityTestID,getActivity)
colnames(rawTestData) <- featureLabels
testDataSet <- data.frame(subject = subjectTestID, activity = activityTest)
colnames(testDataSet) <-c("subject", "activity")
testDataSet <- cbind(testDataSet,rawTestData)

## Get parts of the trainDataSet
rawTrainData    <- read.table(file.path( "UCI HAR Dataset", "train","X_train.txt"))
subjectTrainID  <- read.table(file.path( "UCI HAR Dataset", "train","subject_train.txt"))
activityTrainID <- read.table(file.path( "UCI HAR Dataset", "train","y_train.txt"))

## Construct the trainDataSet
activityTrain <- sapply(activityTrainID,getActivity)
colnames(rawTrainData) <- featureLabels
trainDataSet <- data.frame(subject = subjectTrainID, activity = activityTrain)
colnames(trainDataSet) <-c("subject", "activity")
trainDataSet <- cbind(trainDataSet,rawTrainData)

## merge data sets
dataSet <- rbind(trainDataSet,testDataSet)

## extract mean and std dev, keeping subject and activity, but not keeping meanfrequency or angle
dataSet <- dataSet[,grepl("(subject)|(activity)|(mean)|(std)",names(dataSet))]
dataSet <- dataSet[,!grepl("meanfreq",names(dataSet))]
dataSet <- dataSet[,!grepl("angle",names(dataSet))]

## use labels with desscriptive variable names
dataSetNames <- names(dataSet)
dataSetNames <- sub("^t", "time",dataSetNames)
dataSetNames <- sub("^f", "frequency",dataSetNames) 
dataSetNames <- sub("mag", "magnitude",dataSetNames) 
dataSetNames <- sub("acc", "acceleration",dataSetNames) 
dataSetNames <- sub("std", "standarddeviation",dataSetNames) 
colnames(dataSet) <- dataSetNames

## create an independent, tidy dataset with the average of each variable for each activity and each subject
tidyDataSet <- dataSet %>% 
      group_by(subject,activity)  %>% 
      summarise_each(funs(mean)) 

## write the tidy data set to data file
write.table(tidyDataSet, file = "tidyDataSet.txt", row.names = FALSE)

