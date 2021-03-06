**run_analysis.R:** 

R-script file for extracting a tidy data set consisting of the mean and std measurements for each subject/acitivity combination. This script will create a tidy data set from the original [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Version 1.0               
Author: Ramesh Maganti

Please refer to the **codebook.md** file for more information on the project, the original dataset, the extracted tidy set and the description of each measurement/variable in the tidy data set.


#####STEPS BEFORE RUNNING THE SCRIPT#####
Here are the steps to take before running the R script:

1. Download the zip file [from here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the file to any directory of your choice, say "./projFiles".
Make sure the working directory in R is set to this directory.
4.   Copy the run_analysis.R script to this directory
5.   Make sure the following files and folders are there in this directory ("./projFiles"):

	- 	./projFiles/features.txt
	- 	./projFiles/activity_labels.txt
	- 	./projFiles/train/subject_train.txt
	- 	./projFiles/test/subject_test.txt
	-  	./projFiles/train/X_train.txt
	-  	./projFiles/test/X_test.txt
	-  	./projFiles/train/y_train.txt
	-  	.projFiles/test/y_test.txt
	
Once those steps are complete, you can run the R script (run_analysis.R). Note that "stringr" and the "reshape2" package are required to be loaded.
The output of the R script is a tidy data set, "tidydata.txt"

**NOTE:**
-	To load and view the uploaded tidy data set, "tidydata.txt", please do the following in R/RStudio. 
```
	fileurl<-"https://s3.amazonaws.com/coursera-uploads/user-3e1434223d2d020b5e5f7f02/972137/asst-3/0f7aade0f96811e3a72e3511473680ba.txt"
	download.file(fileurl, destfile="<any_filename>.txt", method="curl")
	tidydata<-read.csv("<any_filename>.txt")
```

##### WHAT DOES THE SCRIPT DO, AND HOW DOES IT WORK#####
###### 1: Load test and training sets including activities and subjects######
- Note the required packages - stringr is used later for processing strings efficiently and reshape2 is required for reshaping and recasting data later on in the script
- all the various files are being read in and assigned, using the read.table function
- All the raw data files, on inspection, do not have any headers and therefore the header=F, in the read.table calls
- there are other concise ways of doing the same thing in R, by combing multiple read.table calls, but preferred the longer approach for clarity and ease of understanding


```
require(stringr)
require(reshape2)
testData <- read.table("./test/X_test.txt",header=FALSE)
testData_act <- read.table("./test/y_test.txt",header=FALSE)
testData_sub <- read.table("./test/subject_test.txt",header=FALSE)
trainData <- read.table("./train/X_train.txt",header=FALSE)
trainData_act <- read.table("./train/y_train.txt",header=FALSE)
trainData_sub <- read.table("./train/subject_train.txt",header=FALSE)
acts <- read.table("activity_labels.txt",header=FALSE,colClasses="character")
```
######1.1 First level merging of the test and train data sets into one set each of the subject, activity and measurements
```
measures<-rbind(testData, trainData)
activities<-rbind(testData_act, trainData_act)
subjects<-rbind(testData_sub, trainData_sub)
```

######2:Use Descriptive activity names to name the activities in the data set######
- The test and train files read in only show the activity numbers for all subjects. 
- An appropriate replacement for this is to replace the activity number with the actual activity name. 
- The levels and labels for activities are read in from the activity_labels text file and a factor variable created
- The test&train activity data frame variable is converted to a factor variable(created with the levels and labels read in from the activity labels text file) 
 

```
activity <- factor(activities$V1,levels=acts$V1,labels=acts$V2)
```

######3: Sets the names of the variable columns in the test and train data sets to the ones read from the activity_labels text file ######
- the features.txt file, contains the variable names for the measurements found in the test and train data sets read in
- this data frame has an integer variable containing values 1:561, for the number of columns and a factor variables that has 477 levels, showing that there are duplicate column variables
- therefore this is read in as a  "character" column to have 561 variables with 561 variable names (some being duplicates)
- Subsequent processing during the extract stage wil remove the duplicate columns, along with the filtered columns


```
features <- read.table("features.txt",header=FALSE,colClasses="character")
colnames(measures)<-features$V2
```
	
	
######4: Merge test and training sets into one data set, and adds the new columns for subject and activity and creates one merged data set######
- The cbind call below adds the activity and subject variables as new columns, named as "subject" and "activity" respectively, to the merged test and train measurement set.
- both of these are required, since the objective of the exercise is to use these two variables as "id" variables or variables for which the measurements are to be extracted
- And the result is one merged data set of the subjects, activities and the measurements


```
mergedData<-cbind(measures, "subject"=subjects$V1, "activity"=activity)
```

######5: Extracts only the measurements on the mean and standard deviation for each measurement, along with the subject and activity columns######
- On analysis, decided that the angle and meanFrequency measurements were redundant as they were derived measurements from the mean and std variables
- These are removed by indexing the mergedData for the columns found by the logical grep call (lgrepl). The ! preceding the lgrep removes the column at the indices
- All other variables other than those variable names that match a mean or std measurement are filtered out
- The subject and activity columns are retained since they are the id variables for which the measurements are to be computed 


```
mergedData<-mergedData[, !grepl("angle|mean[fF]req", colnames(mergedData))]
subdata<-mergedData[, grep("mean|std|activity|subject", colnames(mergedData))]
```

######6: Appropriately labels the data set with descriptive variable names######
- as per tidy data guidelines, changing all variable names to lower case
- removing all alphanumeric characters and replacing them with an empty string,
- replacing the occurence of body twice with a single occurence
- finally reset the names of mergedData with the cleaned set of names 


```
nams<-tolower(colnames(subdata))
nams2<-str_replace_all(nams, "[^[:alnum:]]", "")
nams2<-gsub("bodybody","body", nams2)
colnames(subdata)<-nams2
```

######7: Creates a second, independent tidy data set with the average of each variable for each combination of subject and activity######
-  using the reshape package to melt and cast the entire subset extracted earlier to have subject and activity as the id variables and the values of the rest of the variable set
-  this is then recast to compute the mean of the measurements for each subject/activity combination using the formula in the dcast call
-  Decided to go with a format of Subject1(Activity1:6), Subject2(Activity1:6) rather than the Actiivty/Subject format, since I thought this made better reading, having a comparison of all 6 activities for each subject


```
mt<-melt(subdata, id.vars=c("subject", "activity"))
cmt<-dcast(mt, subject+activity ~ variable, mean)
```
        
        
######8:  Writes the resultant tidy data set to a text file using write.csv######
- using write.csv but saving as a text file. 
- the tidy set created can be read back using the read.csv call


```
write.csv(cmt, file="./tidydata.txt", row.names=F)
```

######Acknowledgements:######
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

######License:######
Use of the Run_Analysis.R script is free for all users.
Use of the resulting dataset "tidydata.txt" in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the author for its use or misuse. Any commercial use is prohibited.

		
		

