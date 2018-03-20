# FinalProject_GettingCleaningData

This is the final project for the getting and cleaning data course.


The script used to generate the data frame is on file **run_analisys.r**

This script first load the data,  
than merge the 2 df (test and train),  
than it reads the feature.txt file to know the names of the variables,   
than it select the columns requested, (mean and std),   
than it changes the names of the variables,   
than it gives descriptive names for the activities,   
than the tidy dataset with the means by group of person and activity  is created.   
Finally it saves this dataset

The final data frame containing the means of the variables requested on the course is on file **Tidy_DataFrame.txt**

The code book can be seen on **CodeBook.md**
