# CleaningDataSet
Tidy Data Set for Accelerometer Data from Samsung Galaxy S Smartphone

Overview:  The untidy data was obtained from the Human Activity Recognition Using Smartphones Dataset (Version 1.0), in which the embedded accelerometer and gyroscope sensors in the Samsung Galaxy S Smartphone were used to detect human movements for 30 subjects wearing smartphones on their waists, each performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING). This data was randomly partitioned into two sets, with 70% of the subjects generating "train" data and 30% generating "test" data.  The data from the sensors was pre-processed into a variety of variables, which will be described below.  To process the untidy data into a tidy data set, the script (run_analysis.R) will perform the following procedures, with more detail below. For details on the data and variables, see the CodeBook.md.

Script: run_analysis.R

Resulting Tidy Data Set: tidyDataSet.txt

Script Assumes:  Script is run from the same directory containing the top file level of the downloaded data "UCI HAR Dataset".

Script Functionality:

1. Loads the necessary data, creates the test and train data.frames.

      a. The data files are read. The untidy files are X_train.txt (7352 rows by 561 columns) and X_test.txt (2947 rows by 561 columns) containing no labels. The 561 columns represent the 561 untidy variables such as tBodyAcc-mean()-X. The original data set was partitioned into these two files with 70% of the subjects randomly selected for the "train" dataset and the other 30% selected for the "test" dataset.  
      
      b. The untidy data variable names file (features.txt) is read, which consists of two columns containing the variable number and the variable name. The variable number column is stripped off leaving a vector of variable names, which are converted to lower case and which have had all punctuation removed.
      
      c. The untidy data activity labels file (activity_labels.txt) is read, which consists of two columns containing the activity id and the corresponding activity name. The activity id column is stripped off leaving a vector of activity names.  A function is written (getActivity) that takes an integer as the activity id and returns the corresponding activity name from this vector. The untidy data activity id files (y_test.txt and y_train.txt) are downloaded. These files provide a vector corresponding to each row of the test and train datasets to indicate the associated activity (1 to 6) for each observation, corresponding to the activity name.  The getActivity function is called on this vector to produce a vector of activity names for each row.
      
      d. The untidy data subject id files (subject_test.txt and subject_train.txt) are downloaded.  These files provide a vector corresponding to each row of the test and train datasets to indicate the associated subject for each observation.
      
      e. The testDataSet and trainDataSet data frames are constructed by using the variable names as the column names, then pre-appending the subject id and activity name columns with names "subject" and "activity," respectively.
            
2. Merges the training and test sets to create one data set. The testDataSet and trainDataSet, both of which contain the same columns, are merged into one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement. As described above, only the 66 mean and standard deviation variables are selected.
            
4. Uses descriptive activity names to name the activities in the data set. (See Transformation 1.e. above.)
      
5. Appropriately labels the data set with descriptive variable names. The variable names are further processed as follows:

      a. Variables that begin with "t" indicating time-domain variables are expanded to begin with "time".
      
      b. Variables that begin with "f" indicating frequency-domain variables are expanded to begin with "frequency".
      
      c. Variables that have had the standard deviation function applied contain the string "std" and are expanded to "standarddeviation".
      
      d. Acceleration ("acc") variables are expanded to "acceleration".
      
      e. Magnitude ("mag") variables are expanded to "magnitude".
      
      f. For example, the untidy variable tBodyAccMag-std(), referring to time-domain measurement of body acceleration magnitude where standard deviation function was applied becomes timebodyaccelerationmagnitudestandarddeviation.
                  
6. From the data set in step5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The data set in step 5 was grouped by subject and activity, then summarized as an average for all variables.  In other words, the 66 tidy mean and standard deviation variables were averaged for each combination of subject (30 possible) and activity (6 possible) to obtain a data set with 30x6 = 180 rows, two columns indicating subject and activity, and 66 columns indicating the 66 measured variables. The resulting tidy data set is named tidyDataSet.
