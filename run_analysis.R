library(dplyr)

## File URL of Raw Data:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data is downloaded as compressed file and extracted into a directory. The variable
## below stores path to a working directory where the archive is extracted to:
dr <- getwd()

## Date raw-data downloaded: "Sun Feb 05 23:44:12 2017"

## Devloped with RStudio Version 1.0.136
## R Version 3.3.2
## Operating System: Windows 7 Professional (64-bit)
## System Intel Core 2 Duo CPU 2.53 GHz 4.00 GB RAM



## This script processes the raw data into the desired format following the steps below:


### A. Load training and test data.
### B. Apply descriptive variable names
### C. Apply activity names to the data set
### D. Table merge operatrions
### E. Extract mean and standard deviation measurements for all trials
### F. Perform Aggregate Statistics for activity and subject, average over variables 
###    and generate new table.
### G. Appropriately label generated data sets with descriptive names



### A.  Load training and test data

## load raw descriptive activity names

setwd(dr)

activitylabels <- read.table("activity_labels.txt" , header = FALSE)
feat <- read.table("features.txt", header = FALSE)

## load raw test data 

setwd(paste0(dr, "/test"))

file1 <- read.table("subject_test.txt", header = FALSE)
file2 <- read.table("X_test.txt", header = FALSE)
file3 <- read.table("Y_test.txt", header = FALSE)

## load raw training data

setwd(paste0(dr,"/train"))

file4 <- read.table("subject_train.txt", header = FALSE)
file5 <- read.table("X_train.txt", header = FALSE)
file6 <- read.table("Y_train.txt", header = FALSE)

## format data into tables

test_subject <- tbl_df(file1)
x_test <- tbl_df(file2)
y_test <- file3[,1]
train_subject <- tbl_df(file4)
x_train <- tbl_df(file5)
y_train <- file6[,1]

labels <- activitylabels[,2]


rm(file1, file2, file3, file4, file5, file6, activitylabels)

### B. Apply descriptive variable names

features <- feat[,2]
names(x_test) <- features
names(x_train) <- features
rm(feat)

### C. Apply activity names the data set 

y_tst <- labels[y_test]
y_trn <- labels[y_train]



### D. Table merge operatrions

## Two horizontal merges (train,test) of X, y, and subject tables

m_table1 <- cbind(x_train, y_trn, train_subject)
m_table2 <- cbind(x_test, y_tst, test_subject)
colnames(m_table1)[562] = c("activity label")
colnames(m_table2)[562] = c("activity label")
colnames(m_table1)[563] = c("subject")
colnames(m_table2)[563] = c("subject")

rm(x_train, x_test, y_trn, y_tst)

## One vertical merge operation of train and test tables 

m_table3 <- rbind(m_table1, m_table2)
tablenames <- make.names(names(m_table3), unique=TRUE, allow_=TRUE)
names(m_table3) <- tablenames
rm(m_table1, m_table2)


### E. Extract mean and standard deviation measurements for all trials

m_table4 <- select(m_table3, contains("mean"), contains("std"), activity.label, subject)

### F. Perform Aggregate Statistics Operations

m_table5 <- aggregate(m_table4, by=list(m_table4$activity.label),mean)
m_table6 <- aggregate(m_table4, by=list(m_table4$subject),mean)


### G. Clean the data

tablenames <- gsub("\\.", " ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\.", " ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\.", " ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\ std", " std-dev ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\ std", " std-dev ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\ std", " std-dev ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\mean", " mean ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\mean", " mean ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\mean", " mean ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Mean", " mean ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Mean", " mean ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Mean", " mean ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Mag", " mag. ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Mag", " mag. ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Mag", " mag. ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Jerk", " jrk ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Jerk", " jrk ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Jerk", " jrk ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Freq", " freq ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Freq", " freq ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Freq", " freq ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Acc", " accel ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Acc", " accel ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Acc", " accel ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\X", "(x-dir)", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\X", "(x-dir)", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\X", "(x-dir)", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Y", "(y-dir)", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Y", "(y-dir)", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Y", "(y-dir)", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\Z", "(z-dir)", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\Z", "(z-dir)", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\Z", "(z-dir)", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\   ", " ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\   ", " ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\   ", " ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames

tablenames <- gsub("\\  ", " ", names(m_table4),fixed=FALSE)
names(m_table4) <- tablenames
tablenames <- gsub("\\  ", " ", names(m_table5),fixed=FALSE)
names(m_table5) <- tablenames
tablenames <- gsub("\\  ", " ", names(m_table6),fixed=FALSE)
names(m_table6) <- tablenames


m_table7 <- cbind(m_table5,m_table6)
setwd(dr)
write.csv(m_table4, file = "merged set.csv")
#write.csv(m_table5, file = "actaverage.csv")
#write.csv(m_table6, file = "subaverage.csv")

#write.table(m_table7,"mergedset.txt",row.name=FALSE)
#write.csv(m_table7, file = "new_merge.csv")
