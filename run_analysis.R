
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",
header= FALSE,
na.strings = "NA",
dec = ".")


x_test <- read.table("UCI HAR Dataset/test/X_test.txt",
header= FALSE,
na.strings = "NA",
dec = ".")

features <- read.table("UCI HAR Dataset/features.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")



activity_data <- rbind(y_test,y_train)

subject_data <- rbind(subject_test,subject_train)

x_data <- rbind(x_test,x_train)



library(plyr)
activity_data <- join(activity_data,activityLabels, by = "V1")

colnames(activity_data) <- c("Activity_No", "Activity")

colnames(subject_data) <- "Subject_No"

colnames(x_data) <- features[,2]

master1 <- cbind(subject_data,activity_data[,2],x_data)

colnames(master1)[2] <- "Activity"


library(reshape2)
dataMelt <- melt(master1,id=c("Subject_No","Activity"),measure.vars=3:563)

subset_std <- subset(dataMelt,grepl("std()",dataMelt$variable))
subset_mean <- subset(dataMelt,grepl("mean()",dataMelt$variable))

master2 <- rbind(subset_mean,subset_std)
master2$variable <- gsub("-","",master2$variable)



library(plyr)
summaryData <- ddply(master2,.(as.character(Subject_No),as.character(Activity),variable),summarise, average=mean(value))
colnames(summaryData)[1:2] <- c("subject_no","activity")
summaryData$subject_no <- as.numeric(summaryData$subject_no)
summaryData <- summaryData[with(summaryData,order(subject_no,activity,variable)),]

write.table(summaryData,file="CP1-Tidy Data.txt")
