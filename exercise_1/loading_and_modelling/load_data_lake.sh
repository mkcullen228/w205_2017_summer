# save my current directory 
MY_CWD=pwd

# creating staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory 
cd ~/staging/exercise_1/

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/0a9879e0-3312-4719-a1db-39fd114890f1?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare.zip
unzip medicare.zip

# Remove first line of files and rename files
MY_FILE1="Hospital General Information.csv"
NEW_FILE1="hospitals.csv"
tail -n +2 "$MY_FILE1" > $NEW_FILE1

MY_FILE2="Timely and Effective Care - Hospital.csv"
NEW_FILE2="effective_care.csv"
tail -n +2 "$MY_FILE2" > $NEW_FILE2

MY_FILE3="Readmissions and Deaths - Hospital.csv"
NEW_FILE3="readmissions.csv"
tail -n +2 "$MY_FILE3" > $NEW_FILE3

MY_FILE4="Measure Dates.csv"
NEW_FILE4="Measures.csv"
tail -n +2 "$MY_FILE4" > $NEW_FILE4

MY_FILE5="hvbp_hcahps_11_10_2016.csv"
NEW_FILE5="surveys_responses.csv"
tail -n +2 "$MY_FILE5" > $NEW_FILE5

# create hdfs dfs directory for each file and put files on hdfs 
hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put $NEW_FILE1 /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/care
hdfs dfs -put $NEW_FILE2 /user/w205/hospital_compare/care

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put $NEW_FILE3 /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put $NEW_FILE4 /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/surveys
hdfs dfs -put $NEW_FILE5 /user/w205/hospital_compare/surveys

# chage directory back to original working directory
cd $MY_CWD

# clean exit
exit 
