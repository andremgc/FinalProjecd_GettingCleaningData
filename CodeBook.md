---
title: "CodeBook"
author: "Andre Costa"
date: "March, 20, 2018"
output: html_document
---


## Introduction

This is the code book for the Getting and Cleaning Data Course Project. It contains the description of the final data, which is stored in the Tidy_DataFrame.csv file. The data was got by filtering, summarizing and handling with the data available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Variables Descriprion

The data in this file is a tidy data composed of the following variables

+ **subject:** informs the number of the person in which the data was measured.
+ **activity:** informs the activity in which the data was collected.
+ 79 Variables containing the mean of a measured variable for a subject and activity. The names used for then was the names from the original database, with a number prefix, which show what was the variable position in the original database. The name in the original database is described as following:

_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz._ 

_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)._ 

_Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)._

_These signals were used to estimate variables of the feature vector for each pattern:  _

_'-XYZ\' is used to denote 3-axial signals in the X, Y and Z directions._

+ _tBodyAcc-XYZ_
+ _tGravityAcc-XYZ_
+ _tBodyAccJerk-XYZ_
+ _tBodyGyro-XYZ_
+ _tBodyGyroJerk-XYZ_
+ _tBodyAccMag_
+ _tGravityAccMag_
+ _tBodyAccJerkMag_
+ _tBodyGyroMag_
+ _tBodyGyroJerkMag_
+ _fBodyAcc-XYZ_
+ _fBodyAccJerk-XYZ_
+ _fBodyGyro-XYZ_
+ _fBodyAccMag_
+ _fBodyAccJerkMag_
+ _fBodyGyroMag_
+ _fBodyGyroJerkMag_

_The set of variables that were estimated from these signals are: _

_mean(): Mean value_
_std(): Standard deviation_

The document of the original dataset contains other variables estimated from the signals but they were not used here. Units for each variable were not provided

## Data preparation

The data used here was obtained by first loading the datasets from the training and testing groups of the dataset. Then, it was selected just the variables whith mean() or std() on its name. After having renamed the variables, a new data frame was created using the functions _group\_by_ and _sumarise\_all_ from the **dplyr** package to get the means of each variable, for each group of activity and person.
