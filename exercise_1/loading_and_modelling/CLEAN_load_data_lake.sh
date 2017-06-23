#!/bin/bash

# save my current directory 
MY_CWD=pwd

# empty and remove staging directories
rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging

# empty and remove hdfs files
# put files on hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/Measures.csv
hdfs dfs -rm /user/w205/hospital_compare/surveys_responses.csv
# remove hdfs dfs directory
hdfs dfs -rmdir /user/w205/hospital_compare

# chage directory back to original working directory
cd $MY_CWD

# clean exit
exit 
