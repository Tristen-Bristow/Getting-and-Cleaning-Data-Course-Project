
#Data Cleaning Project Exercise Using
#Human Activity Recognition Using Smartphones Data Set:

##==================================================================
##Human Activity Recognition Using Smartphones Dataset
##Version 1.0
##==================================================================

This study was collected from UCI Machine Learning Repository. The archive is available from the url 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 

performed six activities (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 

(Samsung Galaxy S II) on the waist. Using its 	embedded accelerometer and gyroscope, we captured 3-axial linear 

acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the 

data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected 

for generating the training data and 30% the test data. 


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-

width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 

gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 

gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 

frequency was used. From each window, a vector of features was obtained by 	calculating variables from the time and 

frequency domain. See'features_info.txt' for more details. 


	 * For each record it is provided:
	======================================

	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 	acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws




Study Design for Data Cleaning
	
The raw data was obtained from an archive located at the UCI Machine Learning Repository, downloaded on Sun Feb 05 	

23:44:12 2017 from the URL listed above. It is in compressed format, and for this project, is extracted, placed in a folder 

with the R script for processing the data. The script itself accepts the file-path to the folder, all file handling 

operations of the data processing are automatic, and all that need be inputted to the R-script is the extracted folder-path. 

The raw data was in no way altered. An R script was written to combine selected tables into a large data-table from the UCI 

HAR Dataset train and test folder. An initial merging between subject records, a list of various modes of physical activity, 

and the corresponding train/test records were applied creating two large agglomerated data-tables. Column labels were 

applied to the combined tables from features.txt, located in the archive root folder of the originating study. These two 

train and test records were combined into a single table, stacked vertically, where the various measurement labels matched 

by column. This was a combination of 2947 and 7257 individual record-series, creating a total of 10204 collection data-

series for the full range of measured physical variables. 


A subset of data was taken from this table where series measurements corresponded to mean and standard deviation summaries 

of the measured data. The column names were re-named according to standard principles of tidy data, and certain variable 

names (corresponding to the column values) were lengthened from their shortened form, affording more descriptive labels for 

the variables. This table was outputted through the R-Script (mergedset.csv), along with agglomerated tables of mean value-

measurements for individual subjects (subaverage.csv), and the classes of measured activity (actaverage.csv).

	The R script was written in the following environment:
	RStudio Version 1.0.136
	R Version 3.3.2
	Operating System: Windows 7 Professional (64-bit)
	CPU System: Intel Core 2 Duo CPU 2.53 GHz 4.00 GB RAM
	

The dataset includes the following files:
=========================================

- 'README.txt'
- 'actaverage.csv'
- 'mergedset.csv'
- 'subaverage.csv'
- 'run_analysis.R'

variable words contain name-elements that can be referenced by the following study definitions:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

the processed data is as follows:

All units are in Hz, except activity and subject, where activities (activity) recorded were: WALKING
WALKING_UPSTAIRS 

WALKING_DOWNSTAIRS, SITTING STANDING,
LAYING, and study subjects (subject) were numbered 1-30.

tBody accel mean (x-dir)  
tBody accel mean (y-dir)  
tBody accel mean (z-dir)  
tGravity accel mean (x-dir)  
tGravity accel mean (y-dir)  
tGravity accel mean (z-dir)  
tBody accel jrk mean (x-dir)  
tBody accel jrk mean (y-dir)  
tBody accel jrk mean (z-dir)  
tBodyGyro mean (x-dir)  
tBodyGyro mean (y-dir)  
tBodyGyro mean (z-dir)  
tBodyGyro jrk mean (x-dir)  
tBodyGyro jrk mean (y-dir)  
tBodyGyro jrk mean (z-dir)  
tBody accel mag. mean  
tGravity accel mag. mean     
tBody accel jrk mag. mean   
tBodyGyro mag. mean   
tBodyGyro jrk mag. mean   
fBody accel mean (x-dir)  
fBody accel mean (y-dir)  
fBody accel mean (z-dir)  
fBody accel mean freq (x-dir)  
fBody accel mean freq (y-dir)  
fBody accel mean freq (z-dir)  
fBody accel jrk mean (x-dir)  
fBody accel jrk mean (y-dir)  
fBody accel jrk mean (z-dir)  
fBody accel jrk mean freq (x-dir)  
fBody accel jrk mean freq (y-dir)  
fBody accel jrk mean freq (z-dir)  
fBodyGyro mean (x-dir)  
fBodyGyro mean (y-dir)  
fBodyGyro mean (z-dir)  
fBodyGyro mean freq (x-dir)  
fBodyGyro mean freq (y-dir)  
fBodyGyro mean freq (z-dir)  
fBody accel mag. mean   
fBody accel mag. mean freq   
fBodyBody accel jrk mag. mean   
fBodyBody accel jrk mag. mean freq   
fBodyBodyGyro mag. mean   
fBodyBodyGyro mag. mean freq   
fBodyBodyGyro jrk mag. mean   
fBodyBodyGyro jrk mag. mean freq   
angle tBody accel mean gravity   
angle tBody accel jrk mean gravity mean   
angle tBodyGyro mean gravity mean   
angle tBodyGyro jrk mean gravity mean   
angle (x-dir) gravity mean   
angle (y-dir) gravity mean     
angle (z-dir) gravity mean   
tBody accel std-dev (x-dir)  
tBody accel std-dev (y-dir)  
tBody accel std-dev (z-dir)  
tGravity accel std-dev (x-dir)  
tGravity accel std-dev (y-dir)  
tGravity accel std-dev (z-dir)  
tBody accel jrk std-dev (x-dir)  
tBody accel jrk std-dev (y-dir)  
tBody accel jrk std-dev (z-dir)  
tBodyGyro std-dev (x-dir)  
tBodyGyro std-dev (y-dir)  
tBodyGyro std-dev (z-dir)  
tBodyGyro jrk std-dev (x-dir)  
tBodyGyro jrk std-dev (y-dir)  
tBodyGyro jrk std-dev (z-dir)  
tBody accel mag. std-dev   
tGravity accel mag. std-dev   
tBody accel jrk mag. std-dev   
tBodyGyro mag. std-dev   
tBodyGyro jrk mag. std-dev   
fBody accel std-dev (x-dir)  
fBody accel std-dev (y-dir)  
fBody accel std-dev (z-dir)  
fBody accel jrk std-dev (x-dir)  
fBody accel jrk std-dev (y-dir)  
fBody accel jrk std-dev (z-dir)  
fBodyGyro std-dev (x-dir)  
fBodyGyro std-dev (y-dir)  
fBodyGyro std-dev (z-dir)  
fBody accel mag. std-dev   
fBodyBody accel jrk mag. std-dev   
fBodyBodyGyro mag. std-dev   
fBodyBodyGyro jrk mag. std-dev   
activity label  
subject    
   
