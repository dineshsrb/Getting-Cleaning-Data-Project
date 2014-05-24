Getting-Cleaning-Data-Project
=============================

### Details of the project
The purpose of this project is to collect, work with, and clean a data set in the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
The goal is to prepare tidy data that can be used for later analysis.

The repo is having two other files
* run_analysis.R - which contains the R code for reading the data, modifying the data set and finally creating a tidy data set
* CodeBook.md - which contains the Data set information, Data set attributes and details of other transformations

### R Code:
It assumes the zip file is downloaded from the above given link and placed in working directory
If you run the code
* It will unzip the file in working directory
* Read and merges the training and test data sets of X, Y, activity labels and features from the folder
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names
* Merges all the data in to one final full dataset
* Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject
* Finally it saves the tidy dataset in the working directory

### CodeBook:
The code book explains the information of data set in the folder and the attribute information

### Output
The final output of the project is tidy dataset with name "tidy.txt" in the working directory


