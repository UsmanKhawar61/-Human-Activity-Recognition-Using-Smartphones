#Human-Activity-Recognition-Using-Smartphones
This project is done as the course end mandatory assignment of Getting and Cleaning Data taught by on Coursera.
*********************************************************************************************
Solution By: Usman Khawar  
Work Email: ukhawar.bee17seecs@seecs.edu.pk  
Institution: National University of Sciences and Technology  
Knowledge Field: Data Science  
Files: README.md, CodeBook.md, run_analysis.R
*********************************************************************************************
Data Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For more information about the data, visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
*********************************************************************************************
run_analysis.R:
This is a script written in R that performs the following tasks sequentially:
1) Importing various relevant datasets from the project directory.
2) Pefrom necessary cleaning individually to those datasets and merge training and test sets.
3) Extract only mean and standard deviation measurements from the vast dataset.
4) Label all the variables in a desciptive and meaningful manner.
5) Replace numeric activity id with desciptive title corresponding to each activity.
6) Exracts a new tidy dataset by grouping with respect to Activity and Subject.
7) Takes a mean of all features for the grouped variables.
8) Writes the extracted data to a new file labeled "Tidy Dataset.txt"
*********************************************************************************************
CodeBook.md:
This markdown file lists all variables and all the work done to transform the data. Refer to this file for information about the dataset variables.
*********************************************************************************************
