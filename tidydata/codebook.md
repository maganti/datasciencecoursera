###Mean and Standard Deviation measurements for subject/activity combinations using the Smartphones Dataset####

######Codebook Version 1.0######
######Author: Ramesh Maganti######


#####Abstract:#####
Mean and Standard deviations extracted from the recordings of 30 subjects performing activities of daily living (ADL), while carrying a waist-mounted Samsung smartphone with embedded inertial sensors
#####Source of the Original Data Set#####
- [Original data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [Original description of the dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#####Information about the Original Data Set#####
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz, were captured in the original dataset. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

To summarize, the original data set consisted of 561 variables across all the above mentioned signals. These included **mean(), std(), mad(), max(), min(), sma(), energy(), iqr(), entropy(), arCoeff(), correlation(), maxInds() meanFREq(), skewness(), kurtosis(), bandsEnergy(), angle()** and others. Please refer to the **features_info.txt** file and the **features.txt** files that can be found at the above link where the Original data set is located, for detailed information on the rationale for the variables, the complete list of variables and their descriptions.

#####Some of the messy issues with the original data set were:#####

-	column headers were values and not variable names
-	multiple types of observational units were all stored in the same data sets
-	single observational units were split into multiple data sets/files
-	variable names were inconsistent and violated most conventions of variable naming for tidy data
-	reshaping resulted in multiple variables being stored in one column
-	incomplete code book

######What is Tidy Data######
The basis for the approach taken for "tidying" the given data set is located at: - [Hadley Wickham's paper on Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf)

An extract from the paper suggests: 

"Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is tidy or messy depending 	   on how rows, columns and tables are matched with observatoins, variables and types.

Broad principles of tidy data:
-	Each variable forms a column
-	Each observation forms a row
-	Each type of observational unit forms a table"
	
#####The tidy version of the dataset, "tidydata.txt"

This effort primarily focussed on the "manipulation" of "messy" data into "tidy" data to address the above mentioned issues and requirements.  Broadly, the steps taken can be classified as:

-	**Filter** - removed or filtered observations to end up with only mean/std observations
-	**Transform** - added the **subject** and **activity** variables to the filtered observations
-	**Aggregate** - collapsed or aggregated the means of all the mean and std measurements per 
	each of the subject/activity combination. Aggregated data about the same observations, from multiple 
	sources into one
-	**Sort** - changed the order of the observations to be ordered by the subject id and each activity
-	**Clean** - named column headers that were values only with no names, changed inconsistent column names 
	into "tidy" names based on the tidy data principles

The resultant tidy version of the original data set consists of one table, Mean and Standard Deviations for each of the Subject/Activity combination. This comprises of only the mean() and std() measurement variables across all signals, for each of the 30 subjects, each performing 6 activities. The accompanying **run_analysis.R"** script file and the **README.md** files provide the R script source code and the instructions and explanations, for **reproducing** this dataset. They provide details on the specific filtering and tidying rules applied that resulted in the tidy data, **tidydata.txt"** and how to read this data set into R.

For the given 30 subjects and 6 activities, the original data set consisting of 10299 observations for 561 variables has been reshaped into 180 observations (30 subjects times 6 activities each), of 68 columns, with subject and activity being the two 'id' variables), and a set of 66  measurement variables representing the averages of the mean and standard deviation for each subject/activity combination. Therefore, each row represens the average of the mean/std measurements for one activity performed by one subject. All observations not pertaining to mean and std measurements have been filtered out

##### The tidy data set#####
In addition to this file that you are reading, **cookbook.md**, there are three other files, included as part of this data set: 
- **'run_analysis.R'**:  A "R" script file, for getting and cleaning the data from the original Human Activity Recognition Data Set 
- **'README.md'**:. Explains the code in the R script in detail.  
- **'tidydata.txt'**: the tidy data set of the mean and standard deviations extracted from the original data set

#####The tidy data and the fields/variables in it#####

The units of each variable are normalized and bounded within [-1,1]. Each variable, below is indicated in italics, with the variable type next to it, followed by a description of the variable name , below in the box. The variables are:


1. - *subject*                  integer (values: 1:30)		
			identifier: identifying each subject, with values ranging from 1:30 
1. - *activities*		 type: Factor with 6 levels 		
		Descriptive name of each subject's activity, having values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 		 	 SITTING, STANDING, LAYING
1. - *tbodyaccmeanx*		double		
		mean of time body acceleration signal along the x-axis 
1. - *tbodyaccmeany*		double
		 mean of time body acceleration signal along the y-axis 
1. - *tbodyaccmeanz*		double
		mean of time body acceleration signal along the z-axis 
1. - *tbodyaccstdx*		double	
		std of time body acceleration signal along the x-axis 
1. - *tbodyaccstdy*		double
		 std of time body acceleration signal along the y-axis
1. - *tbodyaccstdz*		double
		std of time body acceleration signal along the z-axis
1. - *tgravityaccmeanx*		double  
		 mean of gravity body acceleration signal along the x-axis
1. - *tgravityaccmeany*		double	
		 mean of gravity body acceleration signal along the y-axis
1. - *tgravityaccmeanz*		double
		 mean of gravity body acceleration signal along the z-axis
1. - *tgravityaccstdx*		double
		 STD of gravity body acceleration signal along the x-axis
1. - *tgravityaccstdy*		double	
		 std of gravity body acceleration signal along the y-axis
1. - *tgravityaccstdz*		double
		 STD of gravity body acceleration signal along the z-axis
1. - *tbodyaccjerkmeanx*		double
		mean of the time body linear acceleration jerk signal along x-axis
1. - *tbodyaccjerkmeany*		double	
		mean of the time body linear acceleration jerk signal along y-axis
1. - *tbodyaccjerkmeanz*		double	
		 mean of the time body linear acceleration jerk signal along z-axis
1. - *tbodyaccjerkstdx*		double
 		std of the time body linear acceleration jerk signal along x-axis
1. - *tbodyaccjerkstdy*		double	
		std of the time body linear acceleration jerk signal along y-axis
1. - *tbodyaccjerkstdz*		double		
 		std of the time body linear acceleration jerk signal along z-axis
1. - *tbodygyromeanx*		double		
		 mean of the time body angular velocity signal along x-axis
1. - *tbodygyromeany*		double	
 		mean of the time body angular velocity signal along y-axis
1. - *tbodygyromeanz*		double		
 		mean of the time body angular velocity  signal along z-axis
1. - *tbodygyrostdx*		double			
 		std of the time body angular velocity  signal along x-axis
1. - *tbodygyrostdy*		double			
 		std of the time body angular velocity  signal along y-axis
1. - *tbodygyrostdz*	double		
 		std of the time body angular velocity signal along z-axis
1. - *tbodygyrojerkmeanx*		double	
 		mean of the time body angular velocity jerk signal along x-axis
1. - *tbodygyrojerkmeany*	double	
 		mean of the time body angular velocity jerk signal along y-axis
1. - *tbodygyrojerkmeanz*	double	
 		mean of the time body angular velocity jerk signal along z-axis
1. - *tbodygyrojerkstdx*		double		
 		std of the time body angular velocity jerk signal along y-axis
1. - *tbodygyrojerkstdy*		double		
 		std of the time body angular velocity jerk signal along y-axis
1. - *tbodygyrojerkstdz*	double		
 		std of the time body angular velocity jerk signal along y-axis
1. - *tbodyaccmagmean*		double		
 		mean of the magnitude of time body acceleration signal
1. - *tbodyaccmagstd*	double      
 		std of the magnitude of tiem body acceleration signal
1. - *tgravityaccmagmean*		double	
		 mean of the magnitude of time gravity acceleration signal
1. - *tgravityaccmagstd*		double		
 		std of the magnitude of time gravity acceleration signal
1. - *tbodyaccjerkmagmean*		double	
 		mean of the magnitude of time body acceleration jerk signal
1. - *tbodyaccjerkmagstd*	double	
 		std of the magnitude of time body acceleration jerk signal
1. - *tbodygyromagmean*		double		
 		mean of the magnitude of time body gyro signal
1. - *tbodygyromagstd*		double		
 		std of the magnitude of time body gyro signal
1. - *tbodygyrojerkmagmean*		double	
 		mean of the magnitude of time body gyro jerk signal
1. - *tbodygyrojerkmagstd*		double		
 		 std of the magnitude of time body gyro jerk signal
1. - *fbodyaccmeanx*		double		
 		 mean of frequency domain body acceleration signal along the x-axis 
1. - *fbodyaccmeany*	double		
 		 mean of frequency domain body acceleration signal along the y-axis
1. - *fbodyaccmeanz*		double		
 		 mean of frequency domain body acceleration signal along the z-axis
1. - *fbodyaccstdx*		double		
 		std of frequency domain body acceleration signal along the x-axis
1. - *fbodyaccstdy*		double		
 		std of frequency domain body acceleration signal along the x-axis
1. - *fbodyaccstdz*		double		
		 std of frequency domain body acceleration signal along the x-axis
1. - *fbodyaccjerkmeanx*		double	
 		mean of the time body linear acceleration jerk signal along x-axis
1. - *fbodyaccjerkmeany*		double	
 		mean of the time body linear acceleration jerk signal along y-axis
1. - *fbodyaccjerkmeanz*		double	
 		mean of the frequency domain body linear acceleration jerk signal along z-axis
1. - *fbodyaccjerkstdx*		double	
 		std of the frequency domain body linear acceleration jerk signal along x-axis
1. - *fbodyaccjerkstdy*		double	
 		std of the frequency domain body linear acceleration jerk signal along y-axis
1. - *fbodyaccjerkstdz*		double	
 		std of the frequency domain body linear acceleration jerk signal along z-axis
1. - *fbodygyromeanx*		double	
 		mean of the frequency domain body angular velocity signal along x-axis
1. - *fbodygyromeany*		double	
 		mean of the frequency domain body angular velocity signal along y-axis
1. - *fbodygyromeanz*		double	
 		mean of the frequency domain body angular velocity signal along z-axis
1. - *fbodygyrostdx*		double	
 		std of the freqiuency body angular velocity signal along x-axis
1. - *fbodygyrostdy*		double	
 		std of the frequency domain body angular velocity signal along y-axis
1. - *fbodygyrostdz*		double	
 		std of the frequency domain body angular velocity signal along z-axis
1. - *fbodyaccmagmean*		double	
 		mean of the magnitude of frequency domain body acceleration signal
1. - *fbodyaccmagstd*		double	
 		std of the magnitude of frequency domain body acceleration signal
1. - *fbodyaccjerkmagmean*		double	
 		mean of the magnitude of frequency domain body acceleration jerk signal
1. - *fbodyaccjerkmagstd*		double	
 		std of the magnitude of frequency domain body acceleration jerk signal
1. - *fbodygyromagmean*		double	
 		mean of the magnitude of frequency domain body gyro signal
1. - *fbodygyromagstd*		double	
 		std of the magnitude of frequency domain body gyro signal
1. - *fbodygyrojerkmagmean*		double	
 		mean of the magnitude of frequency domain body gyro jerk signal
1. - *fbodygyrojerkmagstd*		---double	
 		std of the magnitude of frequency domain body gyro jerk signal
		




