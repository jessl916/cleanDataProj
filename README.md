# cleanDataProj

This is a course project focusing on data cleaning in R.

## List of files and/or folder in this project
  - "run_analysis.R": script that completes the data cleaning
  - "averageData.txt": tidy data set output after running the script
  - "UCI HAR Dataset":original data folder
  - "README.md": instructions for the script and code book for the "average.txt" data

## How the script 'run_analysis.R' works
1. Download the original dataset  from the link:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  unzip the zip file and save in the same directory of the run_analysis.R file.
2. Run the script; you can also run line by line if wanted. 
3. The following is completed by this script
  - Merges the training and the test sets to create one data set called 'whole'.(Task1)
  - Extracts only the measurements on the mean and standard deviation for each measurement.(Task2)
  - Uses descriptive activity names to name the activities in the data set (Task3)
  - Appropriately labels the data set with descriptive variable names.(Task4)
  - Creates a second, independent tidy data set (named "averageData") with the average of each variable for each activity and each subject.(Task5)
  - save the "averageData" into a txt file called "averageData.txt" (Task6)

## Code book for "averageData.txt"
- subject_id: subject who performed the activity, range from 1 to 30
- activity_label: total of 6 different activities performed: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- column/variable 3-59: the 57 features extracted from the original sets of features, details can be found in the original data folder
