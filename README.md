## Run_Analysis
## Run Analysis projetc for "Getting and Cleaning Data" Coursera course

## Data Source
All data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The .zip file create the "UCI HAR Dataset" directory which contains the following files:
* activity_labels.txt
* features_info.txt
* features.txt
* README.txt
* test (directory)
* train (directory)

Directory "test" contains the files
* subject_test.txt
* X_test.txt
* y_test.txt
* Inertial Signals (directory)

Directory "train" contains the files 
* subject_train.txt
* X_train.txt
* y_train.txt
* Inertial Signals (directory)

Directory "Inertial Signals" contains the files

test directory                       
  body_acc_x_test.txt                  
  body_acc_y_test.txt                  
  body_acc_z_test.txt                  
  body_gyro_x_test.txt                
  body_gyro_y_test.txt                  
  body_gyro_z_test.txt                  
  total_acc_x_test.txt               
  total_acc_y_test.txt                
  total_acc_z_test.txt                

train directory
  body_acc_x_train.txt
  body_acc_y_train.txt
  body_acc_z_train.txt
  body_gyro_x_train.txt
  body_gyro_y_train.txt
  body_gyro_z_train.txt
  total_acc_x_train.txt
  total_acc_y_train.txt
  total_acc_z_train.txt


Main script "run_analysis.R" identify the current working directory and set to the correct WD if not already on it.
This same script reads the .TXT files to merge them. Files used for the project are:
* "UCI HAR Dataset/test/subject_test.txt"
* "UCI HAR Dataset/test/x_test.txt"
* "UCI HAR Dataset/test/y_test.txt"
* "UCI HAR Dataset/train/subject_train.txt"
* "UCI HAR Dataset/train/x_train.txt"
* "UCI HAR Dataset/train/y_train.txt"

Generating as internal results 3 datasets with the merged information:
* subject_out
* x_out
* y_out

Inertial signals files are not considered in this initial stage, so the script ends up with the above only.

Perform the required operations on these datasets


