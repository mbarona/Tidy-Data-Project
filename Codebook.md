Codebook

Step1: Load the following files to R
	1. subject_train.txt stored as "subject_train", with XX variable(s) and XX observations
	2. subject_test.txt stored as "subject_test", with XX variable(s) and XX observations
	1. y_train.txt stored as "activity_train", with XX variable(s) and XX observations
	2. y_test.txt stored as "activity_test", with XX variable(s) and XX observations
	1. x_train.txt stored as "x_train", with XX variable(s) and XX observations
	2. x_test.txt stored as "x_test", with XX variable(s) and XX observations
	1. activityLabels.txt stored as "activityLabels", with XX variable(s) and XX observations
	2. features.txt stored as "features", with XX variable(s) and XX observations

Step2: Merge tables into on data frame
	1. combine activity_test and activity_train data into one, stored as "activity_data", with XX variable(s) and XX observations
	2. combine subject_test and subject_train data into one, stored as "subject_data", with XX variable(s) and XX observations
	3. combine x_test and x_train data into one, stored as "x_data", with XX variable(s) and XX observations
	4. label activity_data with the activityLabels, this will add one column that contains the type of activity name associated with the code stored
		in the activity data, data has now XX variable(s) and XX observations
	5. rename column names of activity_data to "Activity_No" and "Activity"
	6. rename column name of subject_data to "Subject_No"
	7. rename column names of x_data using the "features" vector
	8. merge the activity, subject and x datasets into 1, stored as "master1",with XX variable(s) and XX observations

Step3: Melt master dataset to narrow down the data
	1. create a dataset named dataMelt, where the narrow down data will be stored
		- data is narrowed down by the variables in the x_ dataset and used subject and activity as IDs
	dataMelt, with XX variable(s) and XX observations

Step4: Extracting/subsetting data of measurement mean() and std()
	1. create dataset namd subset_mean and subset_std, stores all data with measurement mean() and std(), respectively
	2. combine both subset_ datasets and store as master2
Step5: Summarize data by average of each subject_no, activity, variable
	1. create data named "summaryData", stores summary of data by average of each subject_no, activity, variable
	2. write the summaryData to file named "CP1-Tidy Data.txt in the working directory
	