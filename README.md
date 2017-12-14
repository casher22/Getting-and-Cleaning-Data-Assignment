# Getting-and-Cleaning-Data-Assignment
Peer reviewed assignment for Coursera Getting and Cleaning Data Course

## Summary
Summarized raw data generated from UC Irvine about Human Activity Recognition Using Smartphones experiment(See UCI's description of the experiment below). The included files average the mean and and standard deviation for each subject and activity. 

## UCI Experiment Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Files included:
1) Samsung Galaxy S Accelerometers- Tidy Data.txt
    - Wide form dataset that averages the means (including mean frequencies) and standard deviations for each subject and activity
    - Use check<-read.table("Samsung Galaxy S Accelerometers- Tidy Data.txt") to load data into R
2) Samsung Accelerometers Codebook.txt
    - Includes description of data, origin of raw data used, and information about variables
3) run_analysis.R
    - Script with explanation of how to transform raw data to tidy data
