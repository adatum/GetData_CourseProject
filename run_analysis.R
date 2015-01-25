## run_analysis.R
## 
## Course Project for "Getting and Cleaning Data" course on Coursera
## 
## Author: adatum
## 
## =================================================================
##
## Assumes data is in a zip file at URL "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Assumes (a minimum) data file/folder structure as follows:
##
## UCI HAR Dataset
##   |
##   |- activity_labels.txt
##   |- features.txt
##   |
##   |- test
##   |  |
##   |  |- subject_test.txt
##   |  |- X_test.txt
##   |  |- y_test.txt
##   |  
##   |- train
##      |
##      |- subject_train.txt
##      |- X_train.txt
##      |- y_train.txt                
## 
## =================================================================

# Libraries
library(data.table)
library(dplyr)



data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_dir <- "./data" # relative directory for data
data_file <- "data.zip"
data_path <- file.path(data_dir, data_file)
uci_dir <- "UCI HAR Dataset"

data_fullpath <- file.path(data_dir, uci_dir)
features_file <- "features.txt"
activity_labels_file <- "activity_labels.txt"
subject_test_file <- "test/subject_test.txt"
data_test_file <- "test/X_test.txt"
datalabels_test_file <- "test/y_test.txt"
subject_train_file <- "train/subject_train.txt"
data_train_file <- "train/X_train.txt"
datalabels_train_file <- "train/y_train.txt"



# create data directory, download data, and unzip
if(!file.exists(data_dir)) {
        dir.create(data_dir)
        download.file(data_url, data_path, method = "curl")
        unzip(data_path, exdir = data_dir)
}

# read data, joining test and train datasets
data <- as.data.table(
                rbind(
                        read.table(file.path(data_fullpath, data_test_file)), 
                        read.table(file.path(data_fullpath, data_train_file))
                        )
                )

subjects <- rbind(
                read.table(file.path(data_fullpath, subject_test_file)), 
                read.table(file.path(data_fullpath, subject_train_file))
                )
names(subjects) <- "subjects"
                
labels <- rbind(
                read.table(file.path(data_fullpath, datalabels_test_file)), 
                read.table(file.path(data_fullpath, datalabels_train_file))
                )
names(labels) <- "labels"

activity_labels <- read.table(file.path(data_fullpath, activity_labels_file)) 

features <- read.table(file.path(data_fullpath, features_file),
                       row.names=1                                
                       )






