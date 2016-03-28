CodeBook.md

Tidy Data Set for Accelerometer Data from Samsung Galaxy S Smartphone

Overview:  The untidy data was obtained from the Human Activity Recognition Using Smartphones Dataset (Version 1.0), in which the embedded accelerometer and gyroscope sensors in the Samsung Galaxy S Smartphone were used to detect human movements for 30 subjects wearing smartphones on their waists, each performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING). This data was randomly partitioned into two sets, with 70% of the subjects generating "train" data and 30% generating "test" data.  The data from the sensors was pre-processed into a variety of variables, which will be described below.  To process the untidy data into a tidy data set, the script (run_analysis.R) will perform the following procedures, with more detail below.

      1. Merges the training and test sets to create one data set.
      
      2. Extracts only the measurements on the mean and standard deviation for each measurement.
      
      3. Uses descriptive activity names to name the activities in the data set.
      
      4. Appropriately labels the data set with descriptive variable names.
      
      5. From the data set in step4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      
Untidy Data Description Website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Untidy Data Obtained From: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables Overview:  The derived variables were obtained in the untidy data as described below and then further processed using a variety of functions to obtain 561 "features."  Because we were interested in the mean and standard deviation variables, we rejected other functions such as "meanFreq()" (the weighted average of the frequency compontents) and angle() (calculates the angle between two vectors, some of which might be mean values). Therefore, we extracted 66 out of 561 untidy derived variables. Derived variables for the untidy data set were obtained as follows:

      1. The accelerometer and gyroscopic sensors produced the x, y, and z components of the acceleration gyroscopic signals as a function of time (tAcc-XYZ and tGyro-XYZ, where t denotes time).
      
      2. These two signals were separated into body and gravity acceleration signals (tBodyAcc-XYZ, tGravityAcc-XYZ) using a low pass filter. The mean and standard deviation functions were applied to these variables in the untidy dataset (for example: tBodyAcc-mean()-X and tGravityAcc-std()-Y). The 18 associated tidy data variables are: 
      
      a. timebodyaccelerationmeanx,    timebodyaccelerationstandarddeviationx
      b. timebodyaccelerationmeany,    timebodyaccelerationstandarddeviationy
      c. timebodyaccelerationmeanz,    timebodyaccelerationstandarddeviationz
      d. timegravityaccelerationmeanx, timegravityaccelerationstandarddeviationx
      e. timegravityaccelerationmeany, timegravityaccelerationstandarddeviationy
      f. timegravityaccelerationmeanz, timegravityaccelerationstandarddeviationz
      g. timebodygyromeanx,            timebodygyrostandarddeviationx
      h. timebodygyromeany,            timebodygyrostandarddeviationy
      i. timebodygyromeanz,            timebodygyrostandarddeviationz
      
      3. The body linear acceleration and angular velocity were derived as "Jerk" signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The mean and standard deviation functions were applied to these variables in the untidy dataset (for example: tBodyAccJerk-mean()-X and tBodyGyroJerk-std()-Y). The 12 associated tidy data variables are:
      
      a. timebodyaccelerationjerkmeanx, timebodyaccelerationjerkstandarddeviationx
      b. timebodyaccelerationjerkmeany, timebodyaccelerationjerkstandarddeviationy
      c. timebodyaccelerationjerkmeanz, timebodyaccelerationjerkstandarddeviationz
      d. timebodygyrojerkmeanx,         timebodygyrojerkstandarddeviationx
      e. timebodygyrojerkmeany,         timebodygyrojerkstandarddeviationy
      f. timebodygyrojerkmeanz,         timebodygyrojerkstandarddeviationz
      
      4. The magnitude (way of combining x,y,z vectors) was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). The mean and standard deviation functions were applied to these variables in the untidy dataset (for example: tBodyAccMag-mean(), tGravityAccMag-mean(), tBodyAccJerkMag-mean(), tBodyGyroMag-mean() ).The 10 associated tidy data variables are:
      
      a. timebodyaccelerationmagnitudemean,      timebodyaccelerationmagnitudestandarddeviation
      b. timegravityaccelerationmagnitudemean,   timegravityaccelerationmagnitudestandarddeviation
      c. timebodyaccelerationjerkmagnitudemean,  timebodyaccelerationjerkmagnitudestandarddeviation
      d. timebodygyromagnitudemean,              timebodygyromagnitudestandarddeviation                    
      e. timebodygyrojerkmagnitudemean,          timebodygyrojerkmagnitudestandarddeviation
      
      5. A Fast Fourier Transform (FFT) was applied to some signals. The mean and standard deviation functions were applied to these variables in the untidy dataset (for example: fBodyAcc-mean()-X, fBodyGyro-std()-Y, fBodyAccMag-mean(), fBodyBodyAccJerkMag-mean() and fBodyBodyGyroJerkMag-std(), where f indicates that these are frequency domain signals.)  These were included because the mean was applied after the derived variable was calculated.  The 26 associated tidy data variables are:
      
      a. frequencybodyaccelerationmeanx,                 frequencybodyaccelerationstandarddeviaionx
      b. frequencybodyaccelerationmeany,                 frequencybodyaccelerationstandarddeviaiony
      c. frequencybodyaccelerationmeanz,                 frequencybodyaccelerationstandarddeviaionz
      d. frequencybodyaccelerationjerkmeanx,             frequencybodyaccelerationjerkstandarddeviationx
      e. frequencybodyaccelerationjerkmeany,             frequencybodyaccelerationjerkstandarddeviationy
      f. frequencybodyaccelerationjerkmeanz,             frequencybodyaccelerationjerkstandarddeviationz
      g. frequencybodygyromeanx,                         frequencybodygyrostandarddeviationx
      h. frequencybodygyromeany,                         frequencybodygyrostandarddeviationy
      i. frequencybodygyromeanz,                         frequencybodygyrostandarddeviationz
      j. frequencybodyaccelerationmagnitudemean,         frequencybodyaccelerationmagnitudestandarddeviation
      k. frequencybodybodyaccelerationjerkmagnitudemean, frequencybodybodyaccelerationjerkmagnitudestandarddeviation
      l. frequencybodybodygyromagnitudemean,             frequencybodybodygyromagnitudestandarddeviation            
      m. frequencybodybodygyrojerkmagnitudemean,         frequencybodybodygyrojerkmagnitudestandarddeviation
      
Variables:  (See description of how each variable was created and which were selected from untidy dataset above.)
      1. subject - the volunteer number [1 to 30]
      2. activity - one of 6 [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING]
      
      3. timebodyaccelerationmeanx
      4. timebodyaccelerationmeany
      5. timebodyaccelerationmeanz
      
      6. timebodyaccelerationstandarddeviationx
      7. timebodyaccelerationstandarddeviationy
      8. timebodyaccelerationstandarddeviationz
      
      9. timegravityaccelerationmeanx
      10. timegravityaccelerationmeany
      11. timegravityaccelerationmeanz
      
      12. timegravityaccelerationstandarddeviationx
      13. timegravityaccelerationstandarddeviationy
      14. timegravityaccelerationstandarddeviationz
      
      15. timebodygyromeanx
      16. timebodygyromeany
      17. timebodygyromeanz
      
      18. timebodygyrostandarddeviationx
      19. timebodygyrostandarddeviationy
      20. timebodygyrostandarddeviationz
      
      21. timebodyaccelerationjerkmeanx
      22. timebodyaccelerationjerkmeany
      23. timebodyaccelerationjerkmeanz
      
      24. timebodyaccelerationjerkstandarddeviationx
      25. timebodyaccelerationjerkstandarddeviationy
      26. timebodyaccelerationjerkstandarddeviationz
      
      27. timebodygyrojerkmeanx
      28. timebodygyrojerkmeany
      29. timebodygyrojerkmeanz
      
      30. timebodygyrojerkstandarddeviationx
      31. timebodygyrojerkstandarddeviationy
      32. timebodygyrojerkstandarddeviationz
      
      33. timebodyaccelerationmagnitudemean
      34. timebodyaccelerationmagnitudestandarddeviation
      35. timegravityaccelerationmagnitudemean
      36. timegravityaccelerationmagnitudestandarddeviation
      37. timebodyaccelerationjerkmagnitudemean
      38. timebodyaccelerationjerkmagnitudestandarddeviation
      39. timebodygyromagnitudemean
      40. timebodygyromagnitudestandarddeviation                    
      41. timebodygyrojerkmagnitudemean
      42. timebodygyrojerkmagnitudestandarddeviation
      
      43. frequencybodyaccelerationmeanx
      44. frequencybodyaccelerationmeany                 
      45. frequencybodyaccelerationmeanz
      
      46. frequencybodyaccelerationstandarddeviaionx
      47. frequencybodyaccelerationstandarddeviaiony
      48. frequencybodyaccelerationstandarddeviaionz
      
      49. frequencybodyaccelerationjerkmeanx             
      50. frequencybodyaccelerationjerkmeany             
      51. frequencybodyaccelerationjerkmeanz
      
      52. frequencybodyaccelerationjerkstandarddeviationx
      53. frequencybodyaccelerationjerkstandarddeviationy
      54. frequencybodyaccelerationjerkstandarddeviationz
      
      55. frequencybodygyromeanx                         
      56. frequencybodygyromeany                         
      57. frequencybodygyromeanz                         
      
      58. frequencybodygyrostandarddeviationx
      59. frequencybodygyrostandarddeviationy
      60. frequencybodygyrostandarddeviationz
      
      61. frequencybodyaccelerationmagnitudemean         
      62. frequencybodyaccelerationmagnitudestandarddeviation
      63. frequencybodybodyaccelerationjerkmagnitudemean
      64. frequencybodybodyaccelerationjerkmagnitudestandarddeviation
      65. frequencybodybodygyromagnitudemean             
      66. frequencybodybodygyromagnitudestandarddeviation            
      67. frequencybodybodygyrojerkmagnitudemean         
      68. frequencybodybodygyrojerkmagnitudestandarddeviation
      
The Data:  The tidy dataset data consists of 180 rows (30 subjects doing 6 activities) versus 66 columns that represent the average of each variable.  For example, the average (0.2789176) of the 53 untidy dataset entries where subject = 1 and activity = STANDING for the tBodyAcc-mean()-X variable (tidy dataset name timebodyaccelerationmeanx) is presented in the tidy dataset in the row representing subject 1 and STANDING activity under the column timebodyaccelerationmeanx.

Transformations:

      1. Downloads, unzips, and loads the necessary data
      
            a. The untidy data set is downloaded as a zip file to a "./data" directory, which is created if necessary.
            
            b. The zip file is unzipped into a file structure.
            
            c. The data files are read. The untidy files are X_train.txt (7352 rows by 561 columns) and X_test.txt (2947 rows by 561 columns) containing no labels. The 561 columns represent the 561 untidy variables such as tBodyAcc-mean()-X. The original data set was partitioned into these two files with 70% of the subjects randomly selected for the "train" dataset and the other 30% selected for the "test" dataset.  
            
            d. The untidy data variable names file (features.txt) is read, which consists of two columns containing the variable number and the variable name. The variable number column is stripped off leaving a vector of variable names, which are converted to lower case and which have had all punctuation removed.
            
            e. The untidy data activity labels file (activity_labels.txt) is read, which consists of two columns containing the activity id and the corresponding activity name. The activity id column is stripped off leaving a vector of activity names.  A function is written (getActivity) that takes an integer as the activity id and returns the corresponding activity name from this vector. The untidy data activity id files (y_test.txt and y_train.txt) are downloaded. These files provide a vector corresponding to each row of the test and train datasets to indicate the associated activity (1 to 6) for each observation, corresponding to the activity name.  The getActivity function is called on this vector to produce a vector of activity names for each row.
            
            g. The untidy data subject id files (subject_test.txt and subject_train.txt) are downloaded.  These files provide a vector corresponding to each row of the test and train datasets to indicate the associated subject for each observation.
            
            h. The testDataSet and trainDataSet data frames are constructed by using the variable names as the column names, then pre-appending the subject id and activity name columns with names "subject" and "activity," respectively.
            
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
                  
      6. From the data set in step5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The data set in step 5 was grouped by subject and activity, then summarized as an average for all variables.  In other words, the 66 tidy mean and standard deviation variables were averaged for each combination of subject (30 possible) and activity (6 possible) to obtain a data set with 30x6 = 180 rows, two columns indicating subject and activity, and 66 columns indicating the 66 measured variables. Both the step 5 and final tidy data sets are written to files, dataSet.txt and tidyDataSet.txt, respectively, in the same data directory off the working directory.
