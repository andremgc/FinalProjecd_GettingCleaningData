rm(list=ls())

library(dplyr)
library(tidyr)

#creating table1

table1<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
label<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
table1<-data.frame(subject,label,table1)

#creating table2

table2<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
label<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
table2<-data.frame(subject,label,table2)

##1 Merging the dataframes and creating a dataframe with all observations

df<-full_join(table1,table2)

## getting the feature names
feature<-read.table(".\\UCI HAR Dataset\\features.txt")

#as there are features with the same name, the names used here is the combination of the
#feature name and its number.
feature<-unite(feature,'feature',V1,V2)[[1]] 

##2 Selecting only mean and std features
df<-df[,c(1:2,(grep("mean|std",feature)+2))] #+2 because the first column has the label and subject

##4 Chosing right names to the variables
names(df)<-c("subject","label",grep("mean|std",feature,value=TRUE))

##3 Using descriptive names for the activities
df$label<-as.factor(df$label)
levels(df$label)<-c("Walking",
                    "Walking_Upstairs",
                    "Walking_Downstairs",
                    "Sitting",
                    "Standing",
                    "Laying")

df<-rename(df,activity=label)


##5 creating a tidy df with the means of each feature for each subject
df.tidy<-df%>%
  group_by(subject,activity)%>%
  summarise_all(mean)

write.csv(df.tidy,"Tidy_DataFrame.csv",row.names = F)

