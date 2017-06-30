#!/bin/bash

# save my current directory 
MY_CWD=pwd

# empty and remove staging directories
rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging

# empty and remove hdfs files
# put files on hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/care/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/measures/Measures.csv
hdfs dfs -rm /user/w205/hospital_compare/surveys/surveys_responses.csv

# remove hdfs dfs directory
hdfs dfs -rmdir /user/w205/hospital_compare/care
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/measures
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/surveys
hdfs dfs -rmdir /user/w205/hospital_compare

# chage directory back to original working directory
cd $MY_CWD

# clean exit
exit 
