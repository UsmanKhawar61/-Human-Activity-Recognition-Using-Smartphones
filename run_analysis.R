###This script will  get, comibne and clean the data retrieved from 
###http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###For the script to run smoothly, make sure the dataset folder is in the working directory

library(dplyr)
library(data.table)
library(plyr)
setwd("C:\\Users\\usman\\Desktop\\Data Science\\Projects\\Human-Activity-Recognition-Using-Smartphones\\UCI HAR Dataset")
cd<- getwd()
#Loading the test individual datasets
setwd("test")
subject_test<- read.csv("subject_test.txt")
X_test<- as.data.frame(fread("X_test.txt"))
y_test<- read.csv("y_test.txt")
setwd(cd)
#Loading the train individual datsets
setwd("train")
subject_train<- read.csv("subject_train.txt")
X_train<- as.data.frame(fread("X_train.txt"))
y_train<- read.csv("y_train.txt")

###Merging the training and test sets into one dataset
names(subject_test)<- "Subject ID"
names(subject_train)<- "Subject ID"
subject<- rbind(subject_train, subject_test)
activity<- rbind(y_train, y_test)
names(activity)<- "Activity ID"
features<- merge(X_train, X_test, all=T)
active_features<- cbind(activity, subject)
features<- features[1:nrow(active_features),]
data<- cbind(features, active_features)
rm(subject_test, X_test, y_test, subject_train, X_train, y_train, subject, activity, features, active_features)

###Extracting only Mean and Standard Deviation Measurements from the data
relevant_indices<- c(1:6, 41:46,81:86, 121:126, 161:166, 201,202,214,215,227,228, 240,241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516,517, 529,530, 542, 543 )
data_mstd<- select(data, c("Activity ID", "Subject ID"), relevant_indices)
rm(relevant_indices, data)

###Naming the activities in the Dataset
data_mstd$`Activity ID`<-gsub("1","WALKING", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<-gsub("2","WALKING_UPSTAIRS", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<-gsub("3","WALKING_DOWNSTAIRS", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<-gsub("4","SITTING", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<-gsub("5","STANDING", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<-gsub("6","LAYING", data_mstd$`Activity ID`)
data_mstd$`Activity ID`<- as.factor(data_mstd$`Activity ID`)

###Renaming the variables appropriate to the data and feature to make data more readable
names_data<- names(data_mstd)[3:length(names(data_mstd))]
names_mean<- c("tBodyAcc_mX","tBodyAcc_mY","tBodyAcc_mZ", "tGravityAcc_mX","tGravityAcc_mY","tGravityAcc_mZ","tBodyAccJerk_mX","tBodyAccJerk_mY","tBodyAccJerk_mZ","tBodyGyro_mX","tBodyGyro_mY","tBodyGyro_mZ","tBodyGyroJerk_mX","tBodyGyroJerk_mY","tBodyGyroJerk_mZ","tBodyAccMag_m","tGravityAccMag_m","tBodyAccJerkMag_m","tBodyGyroMag_m","tBodyGyroJerkMag_m","fBodyAcc_mX","fBodyAcc_mY","fBodyAcc_mZ", "fBodyAccJerk_mX","fBodyAccJerk_mY","fBodyAccJerk_mZ","fBodyGyro_mX","fBodyGyro_mY","fBodyGyro_mZ","fBodyAccMag_m","fBodyBodyAccJerkMag_m","fBodyBodyGyroMag_m","fBodyBodyGyroJerkMag_m")
names_std<- c("tBodyAcc_stdX","tBodyAcc_stdY","tBodyAcc_stdZ", "tGravityAcc_stdX","tGravityAcc_stdY","tGravityAcc_stdZ","tBodyAccJerk_stdX","tBodyAccJerk_stdY","tBodyAccJerk_stdZ","tBodyGyro_stdX","tBodyGyro_stdY","tBodyGyro_stdZ","tBodyGyroJerk_stdX","tBodyGyroJerk_stdY","tBodyGyroJerk_stdZ","tBodyAccMag_std","tGravityAccMag_std","tBodyAccJerkMag_std","tBodyGyroMag_std","tBodyGyroJerkMag_std","fBodyAcc_stdX","fBodyAcc_stdY","fBodyAcc_stdZ", "fBodyAccJerk_stdX","fBodyAccJerk_stdY","fBodyAccJerk_stdZ","fBodyGyro_stdX","fBodyGyro_stdY","fBodyGyro_stdZ","fBodyAccMag_std","fBodyBodyAccJerkMag_std","fBodyBodyGyroMag_std","fBodyBodyGyroJerkMag_std")
relevant_indices<- c(1:3, 7:9, 13:15, 19:21, 25:27,31, 33,35, 37, 39,41:43, 47:49, 53:55, 59, 61, 63, 65 )
names_data[relevant_indices]<- names_mean
names_data[-relevant_indices]<- names_std
names(data_mstd)<- c("Activity ID", "Subject ID", names_data)
rm(names_data, names_mean, names_std, relevant_indices)


###Creating a tidy dataset with mean for each activity and subject
data_tidy<- data_mstd%>%
    group_by(`Subject ID`)%>%
    summarise(Average= mean(tBodyAcc_mX))