#Codebook

#Step1: Load the following files to R
1. subject_train.txt stored as "subject_train", data frame with 1 variable(s) and 7352 observations, containing integer values that represent the subject/volunteer ID 
2. subject_test.txt stored as "subject_test", data frame with 1 variable(s) and 2947 observations, containing integer values that represent the subject/volunteer ID 
3. y_train.txt stored as "activity_train", data frame with 1 variable(s) and 7352 observations, containing integer values that represent the activity done 
2. y_test.txt stored as "activity_test", data frame with 1 variable(s) and 2947 observations, containing integer values that represent the activity done 
1. x_train.txt stored as "x_train", data frame with 561 variable(s) all of numeric values and 7352 observations, contains features measurement estimates 
2. x_test.txt stored as "x_test", data frame with 561 variable(s) all of numeric values and 2947 observations, contains features measurement estimates 
1. activityLabels.txt stored as "activityLabels", data frame with 2 variable(s) and 6 observations, first vector contains integer values that represent the class labels of activity names while the second vector is on factor level and contains list of activity names
2. features.txt stored as "features", with 2 variable(s) and 561 observations, first vector contains integer values, indexes of list of features - which are stored in the second vector, label for x_ datasets.

#Step2: Merge tables into on data frame
1. combine activity_test and activity_train data into one, stored as "activity_data", data frame with 1 variable(s) and 10299 observations, columns inherit properties that of activity train and test datasets
2. combine subject_test and subject_train data into one, stored as "subject_data", data frame with 1 variable(s) and 10299 observations, columns inherit properties that of subject train and test datasets
3. combine x_test and x_train data into one, stored as "x_data", data frame with 561 variable(s) and 10299 observations, columns inherit properties that of x_ train and test datasets
4. label activity_data with the activityLabels, this will add one column that contains the type of activity name associated with the code stored in the activity data, data has now 2 variable(s) and 10299 observations
5. rename column names of activity_data to integer values that represent the class of the activity as "Activity_No" and the activity names as "Activity"
6. rename column name of subject_data to "Subject_No"
7. rename column names of x_data using the "features" vector
8. merge the activity, subject and x datasets into 1, stored as "master1", data frame with 563 variable(s) and 10299 observations

#Step3: Melt master dataset to narrow down the data
1. create a dataset named dataMelt, where the narrow down data will be stored
- data is narrowed down by the variables in the x_ dataset and used subject and activity as IDs
dataMelt, data frame with 4 variable(s) - subject no.(int), activity(factor), variable(factor), value(numeric), and  5777739 observations

#Step4: Extracting/subsetting data of measurement mean() and std()
1. create dataset named subset_mean and subset_std, stores all data with measurement mean() and std(), respectively
-subset_mean, data frame with 4 variables and 473754 observations, these are all data from the dataMelt with measurements that is associated with mean()
-subset_std, data frame with 4 variables and 339867 observations, these are all data from the dataMelt with measurements that is associated with std()

2. combine both subset_ datasets and store as master2
-master2, data frame with 4 variables and 339867 observations, these are all data from the dataMelt with measurements that is associated with both mean() and std()
-removed the "-" character in the "variable" column, to make entries tidier to look at
			
#Step5: Summarize data by average of each subject_no, activity, variable
1. create data named "summaryData", stores summary of data by average of each subject_no, activity, variable. Derived from master2 data, subject_no and activity data were changed to character values
-summaryData, data frame with 4 variables and 14220 observations, containing averages of each subject_no, activity and variable
-there are some changes in the column names of those that had changes in data types after summarizing data, i.e. subject_no and activity
- rename columns to its previous column name, subject_no and activity
-sort summaryData by subject_no, activity then variable, so that entries will be in chronological order
2. the summaryData is written to file named "CP1-Tidy Data.txt in the working directory
	
