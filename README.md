Tidy-Data-Project
=================

#load data into R
#data are saved in folder "UCI HAR Dataset" in the working directory
#loading x_train dataset
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",
header= FALSE,
na.strings = "NA",
dec = ".")
#loading x_test dataset
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",
header= FALSE,
na.strings = "NA",
dec = ".")
#loading the features, label for the x_ datasets
features <- read.table("UCI HAR Dataset/features.txt")
#loading the subject_train dataset
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
#loading the subject_test dataset
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#loading the y_train dataset
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
#loading the y_test dataset
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
#loading the activityLabels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")


#combining test and train data for y_,subject_ and x_ datasets, using rbind
activity_data <- rbind(y_test,y_train)

subject_data <- rbind(subject_test,subject_train)

x_data <- rbind(x_test,x_train)


#join activityLabels and activity_data to create new variable V2 which contains the activity names
library(plyr)
activity_data <- join(activity_data,activityLabels, by = "V1")

#labels the datasets with descriptive variable names
colnames(activity_data) <- c("Activity_No", "Activity")

colnames(subject_data) <- "Subject_No"

colnames(x_data) <- features[,2]


#merge activity_data, subject_data and x_data into one
master1 <- cbind(subject_data,activity_data[,2],x_data)
colnames(master1)[2] <- "Activity"

#melting the master1 data, subject_no and activity as IDs and variables in x_data as variables
library(reshape2)
dataMelt <- melt(master1,id=c("Subject_No","Activity"),measure.vars=3:563)

#extracting/subsetting data with measurement mean() and std()
subset_std <- subset(dataMelt,grepl("std()",dataMelt$variable))
subset_mean <- subset(dataMelt,grepl("mean()",dataMelt$variable))

#combining mean and std subsets to one dataset
master2 <- rbind(subset_mean,subset_std)
#removing the "-" character in the variable, for more neat looking data entries
master2$variable <- gsub("-","",master2$variable)


#summarizing data into average of each subject, activity and variable
library(plyr)
summaryData <- ddply(master2,.(as.character(Subject_No),as.character(Activity),variable),summarise, average=mean(value))
#renaming columns
colnames(summaryData)[1:2] <- c("subject_no","activity")
#change data type of subject_no to numeric for ordering purposes
summaryData$subject_no <- as.numeric(summaryData$subject_no)
#sort data by subject_no, activity, variable
summaryData <- summaryData[with(summaryData,order(subject_no,activity,variable)),]

#writing the summaryData to file named "CP1-Tidy Data.txt in the working directory
write.table(summaryData,file="CP1-Tidy Data.txt")
