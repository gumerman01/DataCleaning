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
- First the zip file is downloaded and unzipped.
- Activity labels, subjects, activity features, test and train measurements are loaded.
- Activity codes are replaced by activity labels.
- Feature labels are added to the column names in the measurement datasets.
- Subject and activity vectors are column bonded to measurement datasets.
- Both Test and Train datasets are row bonded together in dsMerged dataset.
- Means for all columns is calculated and stored in dsMean dataset.
- Standard deviation for all columns is calculated and stored in dsSd dataset.
- A tidy dataset (dsMergedMeans) is created calculating the means grouping subject and activity.
- Resulting dataset is saved to a txt file. 


##TidyDataSet.txt
The resulting file of running the script run_analysis.R
This file is formatted as a comma delimited file. 

##CodeBook.md
Contains an explanation of the contents of the TidyDataSet, indicating the name of the 
columns and organization.