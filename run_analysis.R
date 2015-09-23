#source("/Users/rodrigblanco/Documents/Formacion/Coursera/03_GettingAndCleaningData/Project/run_analysis.R")
setwd("/Users/rodrigblanco/Documents/Formacion/Coursera/03_GettingAndCleaningData/Project")
library(readr)
library(plyr)

#Download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,"./Dataset.zip", method = "curl")
unzip("./Dataset.zip")                      #Unzip data

#Get labels data
dsActLbl <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ")
dsTstLbl <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
dsTrnLbl <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
names(dsTstLbl) <- "Activity"               #Assign Activity to columns names in Test dataset
names(dsTrnLbl) <- "Activity"               #Assign Activity to columns names in Test dataset
ncols <- dim(dsActLbl)[1]
for (i in 1:ncols) {                        #Replace activity code with activity string
    activity <- as.character(dsActLbl[2][dsActLbl$V1==i,])
    dsTrnLbl[dsTrnLbl$Activity==i,] <- activity
    dsTstLbl[dsTstLbl$Activity==i,] <- activity
}

#Get subjects data
dsTstSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
dsTrnSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(dsTstSub) <- "Subject"
names(dsTrnSub) <- "Subject"

#Load data
cols <- rep(16,561) 
dsTest <- read_fwf("./UCI HAR Dataset/test/X_test.txt", col_positions = fwf_widths(cols))
dsTrain <- read_fwf("./UCI HAR Dataset/train/X_train.txt", col_positions = fwf_widths(cols))

#Get features
dsFeat <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = " ")
cFeatures <- as.vector(dsFeat[["V2"]])
names(dsTest) <- cFeatures                  #Assign Features to columns names in Test dataset
names(dsTrain) <- cFeatures                 #Assign Features to columns names in Train dataset

#Bind subject and activities with data and then merge both datasets
dsTest <- cbind(dsTstSub, dsTstLbl, dsTest)
dsTrain <- cbind(dsTrnSub, dsTrnLbl, dsTrain)
dsMerged <- rbind(dsTest, dsTrain)

#Get the means and standard deviation for each column in dataset (except subject and activity)
dsMean <- colMeans(dsMerged[,3:563])        #Calculate Means
dsSd <- apply(dsMerged[3:563], 2, sd)       #Calculate Standard deviation

#Tidy dataset with the average/mean by Subject and Activity
dsMergedMeans <- ddply(dsMerged, .(Subject,Activity), colwise(mean))

#write the output file
write.table(dsMergedMeans, "./TidyDataSet.txt", row.name=FALSE, sep = ",")