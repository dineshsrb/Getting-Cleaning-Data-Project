## Please download the data from the link below and save it in your working folder
## "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

## This will unzip the downloaded file, if its not done already
if (!file.exists("UCI HAR Dataset")) {
        if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
                stop("Required zip file or HAR Dataset is not available, please download the file from above link")
        } else {
                unzip("getdata_projectfiles_UCI HAR Dataset.zip")
        }
}

## Loading the package ## Install the package if you get error
library(reshape)
library(gdata)

## project
## 1. Merges the training and the test sets to create one data set
## set the directory
setwd("./UCI HAR Dataset")
datTrain <- read.table("train/X_train.txt",header=FALSE)
datTest <- read.table("test/X_test.txt",header=FALSE)
## concatenate test set and train xset
tmp1 <- rbind(datTrain, datTest)

##Similarly for subject_train and subject_test
datTrain <- read.table("train/subject_train.txt",header=FALSE)
datTest <- read.table("test/subject_test.txt",header=FALSE)
tmp2 <- rbind(datTrain, datTest)

## Similarly for y_train and y_test
datTrain <- read.table("train/y_train.txt",header=FALSE)
datTest <- read.table("test/y_test.txt",header=FALSE)
tmp3 <- rbind(datTrain, datTest)

## read activity label content
activity<- read.table("activity_labels.txt")
## read features
features <- read.table("features.txt")

## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## First, get indices of instance with mean and standard deviation
id <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
## subset only these values
tmp1 <- tmp1[, id]
names(tmp1) <- features[id, 2]

## 3. Uses descriptive activity names to name the activities in the data set
## Substitute activity name for combined y trained - tested file as label
tmp3[,1] = activity[tmp3[,1], 2]

## 4. Appropriately labels the data set with descriptive activity names.
names(tmp2) <- "subjects"
names(tmp3) <- "activities"

## merging all data into one, this is full merged dataset
combinedData <- cbind(tmp1, tmp2, tmp3)

## 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
numCols = dim(combinedData)[2]
nactivities = length(activity[,1])
nsubjects = length(unique(tmp2)[,1])

## Find number of unique subject
uSubjects = unique(tmp2)[,1]

## Melt to create a second final tidy dataset 
md <- melt(combinedData, id.vars=c("activities","subjects"))
meanData <- dcast(md,subjects + activities ~ variable,mean)
setwd("..")
write.table(meanData, "tidy.txt", sep="\t")

## End of the run_analysis