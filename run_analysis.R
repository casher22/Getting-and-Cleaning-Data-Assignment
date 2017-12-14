##read each text file into R using a space as the separator
        xtest<-read.table("X_test.txt",sep="")
        xtrain<-read.table("X_train.txt",sep="")
        ytest<-read.table("y_test.txt",sep="")
        ytrain<-read.table("y_train.txt",sep="")
        subjecttest<-read.table("subject_test.txt",sep="")
        subjecttrain<-read.table("subject_train.txt",sep="")
        features<-read.table("features.txt",sep = "")
        activitylabels<- read.table("activity_labels.txt",sep = "")

##combine columns of x,y,and subject test datasets 
        test<-cbind(subjecttest,ytest,xtest)
##check- test dimensions should be 2,947 rows and 563 columns

##combine columns of x,y,and subject test datasets
        train<-cbind(subjecttrain,ytrain,xtrain)
##check- train dimensions should be 7,352 rows and 563 columns

## combine rows of test and train datasets
        combineddata<-rbind(test,train)
##check- combineddata dimensions should be 10,299 rows and 563 columns

##extract list of features from the features dataset and change the class from factor to character
        featuressub<-as.character(features$V2)

## use the extracted features list as column headers for the combineddata set starting in column 3
## rename the first two columns subject and activity
        colnames(combineddata)<-c("subject","activity",featuressub)

##create list of column names that include "mean"
        featuresmean<-grep("mean",names(combineddata),value=TRUE)

##create list of column names that include "std"
        featuresstd<-grep("std",names(combineddata),value=TRUE)

##combine lists of mean and std column names
        featuressub<-c(featuresmean,featuresstd)

##subset combineddata set to only include subject, activity, and columns with the words mean,
## or std in the name
## list of columns with the words mean or std in the name was created above (featuressub)
library(dplyr)
        combinedsub<-combineddata[,c("subject","activity",featuressub)]

## use activitylabels as reference to change numbers in activity column to corresponding 
##activity descriptions
        combinedsub$activity[combinedsub$activity == 1] <- "WALKING"
        combinedsub$activity[combinedsub$activity == 2] <- "WALKING_UPSTAIRS"
        combinedsub$activity[combinedsub$activity == 3] <- "WALKING_DOWNSTAIRS"
        combinedsub$activity[combinedsub$activity == 4] <- "SITTING"
        combinedsub$activity[combinedsub$activity == 5] <- "STANDING"
        combinedsub$activity[combinedsub$activity == 6] <- "LAYING"

##Update column names to be more descriptive by removing by removing unused metacharacters 
##and elaborating on names
##Remove parenthesis
        newheaders<-gsub("\\()","",names(combinedsub))

##remove subject and activity from list as these names should stay the same
        newheaders1<-newheaders[3:81]

##change "f" to frequency
        newheaders2<-gsub("^f","frequency",newheaders1)

##change "t" to time
        newheaders3<-gsub("^t","time",newheaders2)

##update dataset with new column headers
##first two columns should keep the same name as before, but must be listed to ensure the headers
##align to the correct columns
        colnames(combinedsub)<-c("subject","activity",newheaders3)

##create a new data set that groups and summarizes the variables by subject and activity
        summarizeddata<- combinedsub %>% group_by(subject,activity) %>% summarise_each(funs(mean))
##check- summarizeddata dimensions should be 180 rows and 81 columns

##save to txt file
        write.table(summarizeddata,file="Samsung Galaxy S Accelerometers- Tidy Data.txt",row.names = FALSE)
