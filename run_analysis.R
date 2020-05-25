###This script will  get, comibne and clean the data retrieved from 
###http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###For the script to run smoothly, make sure the dataset folder is in the working directory

library(dplyr)
library(data.table)
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

