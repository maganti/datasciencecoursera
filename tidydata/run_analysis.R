#NOTE:
# Please refer to the "codebook.md" file for a detailed explanation on the approach and rationale for reshaping and 
# converting the original data set into a tidy data set. 

#To load and view the uploaded tidy data set, "tidydata.txt", please do the following in R/RStudio:
#       fileurl<-"https://s3.amazonaws.com/coursera-uploads/user-3e1434223d2d020b5e5f7f02/972137/asst-3/d67125c0f7a911e39d86eb19968144a8.txt"
#       download.file(fileurl, destfile="<any_filename>.txt", method="curl")
#       tidydata<-read.csv("<any_filename>.txt")

# Please refer to the "README.md" file for a detailed explanation about this script and each of the processing steps taken

#required packages for string processing and reshaping datasets
        require(stringr)
        require(reshape2)
#All the data files from the test and train folders, along with the activity_labels text file are read into R
# specifying the header=FALSE since the data files do not have HEADERS in them. 
        testData <- read.table("./test/X_test.txt",header=FALSE)
        testData_act <- read.table("./test/y_test.txt",header=FALSE)
        testData_sub <- read.table("./test/subject_test.txt",header=FALSE)
        trainData <- read.table("./train/X_train.txt",header=FALSE)
        trainData_act <- read.table("./train/y_train.txt",header=FALSE)
        trainData_sub <- read.table("./train/subject_train.txt",header=FALSE)
        acts <- read.table("activity_labels.txt",header=FALSE,colClasses="character")
#first level merging of the test and train data sets, and consolidating them into
# the combined rows of 10299 each,  for the measurements, the subjects and actitvites, 
        measures<-rbind(testData, trainData)
        activities<-rbind(testData_act, trainData_act)
        subjects<-rbind(testData_sub, trainData_sub)
#uses descriptive activity names to name the activities in the data set. Replacing the numeric activity levels
# with the descriptive ones read in from the activity_labels file. 
        activity <- factor(activities$V1,levels=acts$V1,labels=acts$V2)
#sets the names of the variable columns in the test and train data sets (measures) to the ones 
#read from the activity_labels text file
        features <- read.table("features.txt",header=FALSE,colClasses="character")
        colnames(measures)<-features$V2
#merges the test and train data sets, adds the new columns for subject and 
#activity and creates one merged data set
        mergedData<-cbind(measures, "subject"=subjects$V1, "activity"=activity)
#Extracts only the measurements on the mean and standard deviation for 
#each measurement, along with the subject and activity columns
        mergedData<-mergedData[, !grepl("angle|mean[fF]req", colnames(mergedData))]
        subdata<-mergedData[, grep("mean|std|activity|subject", colnames(mergedData))]
#Appropriately label the dataset with descriptive variable names. using principles of tidy data to make  
#the columns entirely in lower case, drop all alpha numeric characters, replace the occurence of "bodybody" twice to 
#the more appropriate "body" and then finally reset the column names of the data to the cleaned version
        nams<-tolower(colnames(subdata))
        nams2<-str_replace_all(nams, "[^[:alnum:]]", "")
        nams2<-gsub("bodybody","body", nams2)
        colnames(subdata)<-nams2
#creating a second tidy data set with the average of each variable for each 
# activity and each subject. using melt to reshape the data by subject and activity
#using dcast to aggregate the data to have only the averages of the mean and std values for the
#subject/activity combination
        mt<-melt(subdata, id.vars=c("subject", "activity"))
        cmt<-dcast(mt, subject+activity ~ variable, mean)
#writes the resultant tidy data set to a file using write.csv
        write.csv(cmt, file="./tidydata/tidydata.txt", row.names=F)
