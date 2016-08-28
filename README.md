# Getting and Cleaning Data

## Course Project (Due August 28, 2016)

This repository contains four files:

1. README.md: if you didn't know, you're reading it right now;
2. run_analysis.R: The R script that is explained below;
3. tidy.txt: the output of run_analysis.R; and,
4. CodeBook.md: the code book for tidy.txt.

### run_analysis.R

run_analysis.R completes the following tasks:

1. Merges the training and the test sets to create one data set;
2. Extracts only the measurements on the mean and standard deviation for each measurement;
3. Uses descriptive activity names to name the activities in the data set;
4. Appropriately labels the data set with descriptive activity names; and,
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### To run the script, begin by completing these tasks:

1. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip);
2. Unzip the file;
3. Move the following files to the same working directory as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`
4. Execute run_analysis.R

### Have a great day!


