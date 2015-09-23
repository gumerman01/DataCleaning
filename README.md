# DataCleaning

##Instructions
Original data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the 
   average of each variable for each activity and each subject.

##run_analysis.R
Contains All the steps to download and transform the original data into the tidy dataset 
mentioned in point 5 of the instructions.
File is formatted as a comma delimited file. 

##TidyDataSet.txt
The resulting file of running the script run_analysis.R

##CodeBook.md
Contains an explanation of the contents of the TidyDataSet, indicating the name of the 
columns and organization.