## Before run this script, please download the data, unzipped it,
## and then save it in the same folder of my R file

## load library
library(dplyr)
library(tibble)

## get directory of the data
wd <- getwd()
datadir <- paste0(wd,"/UCI HAR Dataset")
testdir <- paste0(datadir,"/test")
traindir <- paste0(datadir,"/train")

## load all the data related to this project
## training and test sets
train <- read.table(paste0(traindir,"/X_train.txt"))  
test <- read.table(paste0(testdir,"/X_test.txt")) 
## subject id
subject_train <- read.table(paste0(traindir,"/subject_train.txt"))
subject_test <- read.table(paste0(testdir,"/subject_test.txt"))
## activity id
activity_train <- read.table(paste0(traindir,"/y_train.txt"))
activity_test <- read.table(paste0(testdir,"/y_test.txt"))
## activity labels and features
activity_labels <- read.table(paste0(datadir,"/activity_labels.txt"))
features <- read.table(paste0(datadir,"/features.txt"))

## (Task1) Merges the training and the test sets to create one data set, "whole" 
whole <- rbind(train,test)
colnames(whole) <- features$V2

## (Task2) Extracts only the measurements on the mean and std for each measurement 
needed_index <- features$V1[grep("*-(mean\\(\\))|std\\(\\)-",features$V2)]
whole<-whole[,needed_index]

#### add more variables: subject_id, activity_id
whole$subject_id <- rbind(subject_train,subject_test)[,1]
whole$activity_id <- rbind(activity_train,activity_test)[,1]
#### for better data manipulation
whole<-as_tibble(whole)

## (Task3)Uses descriptive activity names to name the activities in the data set
colnames(activity_labels) <- c("activity_id","activity_label")
whole<-inner_join(whole, activity_labels, by="activity_id") # using dplyr package
whole<-select(whole,-"activity_id") # using dplyr package

## (Task4) Appropriately labels the data set with descriptive variable names
## replace unclear acronyms
names(whole) <- gsub("Acc", "Accelerometer", names(whole))
names(whole) <- gsub("Gyro", "Gyroscope", names(whole))

## (Task5) creates second tidy dataset with the average of 
## each variable for each activity and subject 
averageData <- aggregate(. ~subject_id + activity_label, whole, mean)

## (Task6) save the data and export it
write.table(averageData, file = "averageData.txt", row.names = FALSE)
