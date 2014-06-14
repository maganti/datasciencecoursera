==================================================================
Mean and Standard deviations for a set of 30 subjects, each of whom have been measured for six activities. This is a tidy version of the data, extracted from the original source, the Human Activity Recognition Using Smartphones Dataset

==================================================================
Ramesh Maganti
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz, were captured in the original dataset. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The tidy version of the subset of the original Samsung data consists of one table, Mean and Standard Deviations for each of the SubjectActivity combination. there are 30 subjects, each performing 6 activities. The table is in the Mean and Standard Deviation for Subject_Activity.txt file

The table consists of 81 variables and provides the mean and standard deviations aggregated from the super set of all measurements. Each record provides these values for every combination of subject and each activity. the 81 variables are:

Data frame:mydata

180 observations and 81 variables, maximum # NAs:0
Name


- subject				integer
- activities	6		integer$
- tbodyaccmeanx		double
- tbodyaccmeany		double
- tbodyaccmeanz		double
- tbodyaccstdx		double
- tbodyaccstdy		double
- tbodyaccstdz		double
- tgravityaccmeanx		double
- tgravityaccmeany		double
- tgravityaccmeanz		double
- tgravityaccstdx		double
- tgravityaccstdy		double
- tgravityaccstdz		double
- tbodyaccjerkmeanx		double
- tbodyaccjerkmeany		double
- tbodyaccjerkmeanz		double
- tbodyaccjerkstdx		double
- tbodyaccjerkstdy		double
- tbodyaccjerkstdz		double
- tbodygyromeanx		double
- tbodygyromeany		double
- tbodygyromeanz		double
- tbodygyrostdx		double
- tbodygyrostdy		double
- tbodygyrostdz		double
- tbodygyrojerkmeanx		double
- tbodygyrojerkmeany		double
- tbodygyrojerkmeanz		double
- tbodygyrojerkstdx		double
- tbodygyrojerkstdy		double
- tbodygyrojerkstdz		double
- tbodyaccmagmean		double
- tbodyaccmagstd		double
- tgravityaccmagmean		double
- tgravityaccmagstd		double
- tbodyaccjerkmagmean		double
- tbodyaccjerkmagstd		double
- tbodygyromagmean		double
- tbodygyromagstd		double
- tbodygyrojerkmagmean		double
- tbodygyrojerkmagstd		double
- fbodyaccmeanx		double
- fbodyaccmeany		double
- fbodyaccmeanz		double
- fbodyaccstdx		double
- fbodyaccstdy		double
- fbodyaccstdz		double
- fbodyaccmeanfreqx		double
- fbodyaccmeanfreqy		double
- fbodyaccmeanfreqz		double
- fbodyaccjerkmeanx		double
- fbodyaccjerkmeany		double
- fbodyaccjerkmeanz		double
- fbodyaccjerkstdx		double
- fbodyaccjerkstdy		double
- fbodyaccjerkstdz		double
- fbodyaccjerkmeanfreqx		double
- fbodyaccjerkmeanfreqy		double
- fbodyaccjerkmeanfreqz		double
- fbodygyromeanx		double
- fbodygyromeany		double
- fbodygyromeanz		double
- fbodygyrostdx		double
- fbodygyrostdy		double
- fbodygyrostdz		double
- fbodygyromeanfreqx		double
- fbodygyromeanfreqy		double
- fbodygyromeanfreqz		double
- fbodyaccmagmean		double
- fbodyaccmagstd		double
- fbodyaccmagmeanfreq		double
- fbodybodyaccjerkmagmean		double
- fbodybodyaccjerkmagstd		double
- fbodybodyaccjerkmagmeanfreq		double
- fbodybodygyromagmean		double
- fbodybodygyromagstd		double
- fbodybodygyromagmeanfreq		double
- fbodybodygyrojerkmagmean		double
- fbodybodygyrojerkmagstd		double
- fbodybodygyrojerkmagmeanfreq		double
