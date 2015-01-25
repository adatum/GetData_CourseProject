Getting and Cleaning Data  
==========  
###**Course Project**  

run_analysis.R is an R script for joining and tidying the Human Activity Recognition Using Smartphones data set (UCI HAR Dataset) available from the UCI Machine Learning Repository available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where a full description can be found.

###To run:
- source the run_analysis.R script
- the script will automatically download, unzip, and process the data, or
- if the data is already available locally, put the zipped file called `data.zip` in a directory called `data` in your workding directory. i.e. `./data/data.zip`

###What it does:  
1. joins the separate training and test data sets into one data set
2. adds descriptive activity labels
3. adds descriptive, column-legal feature/variable names
4. subsets the data to include only mean and standard deviation measurments
5. outputs a tidy data set of the average values of the data subset for each subject and activity

###Output:
`tidydata.txt` which has dimensions 180x88 (180 rows = 30 subjects X 6 activities; 88 columns = 86 features + subjects + activities)
  
    
--------    
_Note:_ The text of `tidydata.txt` may appear to have the subjects and activities as rows. This is due to the way `write.table` outputs the file, however the data frame/table in R will have the expected 180x88 dimensions.

