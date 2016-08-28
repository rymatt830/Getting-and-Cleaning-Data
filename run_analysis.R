library(reshape2)
# Read in all data:
    subject_train <- read.table("subject_train.txt")
    subject_test <- read.table("subject_test.txt")
    X_train <- read.table("X_train.txt")
    Y_train <- read.table("Y_train.txt")
    X_test <- read.table("X_test.txt")
    Y_test <- read.table("Y_test.txt")
    features <- read.table("features.txt")

# Combine data by binding rows of test and train data:
    subjects <- bind_rows(subject_test, subject_train)
    xcombine <- bind_rows(X_test, X_train)
    ycombine <- bind_rows(Y_test, Y_train)

# Declare column names for the combined data
    dataNames <- as.character(features$V2)
    dataNames <- make.names(dataNames, unique = TRUE)
    names(xcombine) <- dataNames
    names(subjects) <- "SubjectID"
    names(ycombine) <- "Activity"

# Merge the combined datasets into one dataframe:
    combined_data <- cbind(subjects, ycombine, xcombine)

# Extracts only the mean and standard deviation for each measurement,
# while keeping our "SubjectID" and "Activity" variables:
    meanstd <- grepl("*mean*", names(combined_data)) |
                grepl("*std*", names(combined_data))

    meanstd[1:2] <- TRUE
    combined_data <- combined_data[,meanstd]
    
# Use descriptive activity names to name the activities in the data set:
    combined_data$Activity <- as.factor(combined_data$Activity)

    levels(combined_data$Activity) <- 
      list(WALKING ="1",
           WALKING_UPSTAIRS = "2",
           WALKING_DOWNSTAIRS = "3",
           SITTING = "4",
           STANDING = "5",
           LAYING = "6")

# Appropriately label the data set with descriptive variable names:
    cdnames <- names(combined_data)
    cdnames <- sub("t", "time", cdnames)
    cdnames <- sub("f", "freqDomainSignals", cdnames)
    cdnames <- gsub("Acc", "Accelerometer", cdnames)
    cdnames <- gsub("Gyro", "Gyroscope", cdnames)
    cdnames <- gsub("Jerk", "JerkSignal", cdnames)
    cdnames <- gsub("Mag", "Magnitude", cdnames)
    cdnames[1:2] <- c("SubjectID", "Activity")
    finalDF <- combined_data
    names(finalDF) <- cdnames

# Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject:
    pretidy <- melt(finalDF, id=c("SubjectID", "Activity"))
    tidy <- dcast(pretidy, SubjectID + Activity ~ variable, mean)

# Write the tidy data set to a text file ("tidy.txt"):
    write.table(tidy, "tidy.txt", row.names = FALSE)
  
