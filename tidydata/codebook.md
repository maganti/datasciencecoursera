###Mean and Standard Deviation measurements for subject/activity combinations using the Smartphones Dataset####

###Codebook Version 1.0###
###Ramesh Maganti

=====================================================
#####Abstract:#####
Mean and Standard deviations extracted from the recordings of 30 subjects performing activities of daily living (ADL), while carrying a waist-mounted Samsung smartphone with embedded inertial sensors
#####Source of the Data Set#####
- [Original data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [Original description of the dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#####Information about the Data Set#####
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz, were captured in the original dataset. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This is the tidy version of the subset of the original Samsung data consisting of one table, Mean and Standard Deviations for each of the Subject/Activity combination. There are 30 subjects, each performing 6 activities. The table is in the **mean_std_subject_activity.txt'** file

##### The tidy data set#####
In addition to this file that you are reading, **cookbook.md**, there are three other files, included as part of this data set: 
- **'run_analysis.R'**:  A "R" script file, for getting and cleaning the data from the original Human Activity Recognition Data Set 
- **'README.md'**:. Explains the code in the R script in detail.  
- **'mean_std_subject_activity.txt'**: the tidy data of the mean and standard deviations extracted from the original data set


#####The tidy data and the fields/variables in it#####
The original data set consisted of 561 measurement variables for each subject, performing one of six activities. This data set is an extract from the 561 column data set, and the subject and activity data sets, filtered down to 68 in all, 66 from the 561 measurement variables and two new variables, subject and the the activity performed by each subject. The 66 measurements captured here represent only the mean and std variables, as specified by the intent of this exercise and all others were discarded. The 68 variables are a result of processing rules applied to keep only the mean and standard deviation measurements for subject/activity combination and discard all others. Each record provides these values for every combination of activity and each of the 30 subjects. 

The units of each variable are normalized and bounded within [-1,1]. Each variable, below is indicated in italics, with the variable type next to it, followed by a description of the variable name , below in the box. The variables are:


1. - *subject*                  integer (values: 1:30)
		 identifier: identifying each subject, with values ranging from 1:30 
1. - *activities*		 type: Factor with 6 levels 
		 Descriptive name of each subject's activity, having values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
1. - *tbodyaccmeanx*		double
 		mean of time body acceleration signal along the x-axis 
1. - *tbodyaccmeany*	double	
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
1. - *tbodygyrostdz	*	double		
 		std of the time body angular velocity signal along z-axis
1. - *tbodygyrojerkmeanx*		double	
 		mean of the time body angular velocity jerk signal along x-axis
1. - *tbodygyrojerkmeany	*	double	
 		mean of the time body angular velocity jerk signal along y-axis
1. - *tbodygyrojerkmeanz	*	double	
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
1. - *tbodyaccjerkmagstd	*	double	
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
		




