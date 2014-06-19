# PLEASE see the README.md file for detailed explanation about this script and each of the processing steps

#required packages for string processing and reshaping datasets

    require(stringr)
    require(reshape2)
    
# specifying the header=FALSE since the data files do not have HEADERS in them. 
#All the data files from the test and train folders, along with the activity_labels text file are read into R

    testData <- read.table("./test/X_test.txt",header=FALSE)
    testData_act <- read.table("./test/y_test.txt",header=FALSE)
    testData_sub <- read.table("./test/subject_test.txt",header=FALSE)
    trainData <- read.table("./train/X_train.txt",header=FALSE)
    trainData_act <- read.table("./train/y_train.txt",header=FALSE)
    trainData_sub <- read.table("./train/subject_train.txt",header=FALSE)
    activities <- read.table("activity_labels.txt",header=FALSE,colClasses="character")
    
#uses descriptive activity names to name the activities in the data set. Replacing the numeric activity levels
# with the descriptive ones read in from the activity_labels file. Ensured the proper order of levels and labels, by 
# reading in the file's classes as "character"

    testData_act$V1 <- factor(testData_act$V1,levels=activities$V1,labels=activities$V2)
    trainData_act$V1 <- factor(trainData_act$V1,levels=activities$V1,labels=activities$V2)
    
#sets the names of the variable columns in the test and train data sets to the #ones read from the "features.text" file. 
#Once again, reading in by setting colClasses to character, to properly extract the column names

    features <- read.table("features.txt",header=FALSE,colClasses="character")
    colnames(testData)<-features$V2
    colnames(trainData)<-features$V2
    colnames(testData_act)<-c("activity")
    colnames(trainData_act)<-c("activity")
    colnames(testData_sub)<-c("subject")
    colnames(trainData_sub)<-c("subject")
    
#merges the test and train data sets, adds the new columns for subject and 
#activity and creates one merged data set

    testData<-cbind(testData,testData_act, testData_sub)
    trainData<-cbind(trainData,trainData_act, trainData_sub)
    mergedData<-rbind(testData,trainData)
    
#Extracts only the measurements on the mean and standard deviation for 
#each measurement

    mergedData<-mergedData[, !grepl("angle|mean[fF]req", colnames(mergedData))]
    subdata<-mergedData[, grep("mean|std|activity|subject", colnames(mergedData))]
    
#Appropriately label the dataset with descriptive variable names. Following the
#principles of tidy data, by changing all the column names to lowercase, replacing all 
#alphanumeric character, replacing occurrence of "body" twice and #then setting the names 
#of the mergedData with the cleaned column names

    nams<-tolower(colnames(subdata))
    nams2<-str_replace_all(nams, "[^[:alnum:]]", "")
    nams2<-gsub("bodybody","body", nams2)
    colnames(subdata)<-nams2
    
#creating a second tidy data set with the average of each variable for each 
# activity and each subject

    mt<-melt(subdata, id.vars=c("subject", "activity"))
    cmt<-dcast(mt, subject+activity ~ variable, mean)
    
#writes the resultant tidy data set to a file using write.csv

    write.csv(cmt, file="./tidydata.txt", row.names=F)
    tidydata<-read.csv("./tidydata.txt", stringsAsFactors=F)
