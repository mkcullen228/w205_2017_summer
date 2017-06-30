-- hospitals
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
    provider_id string, 
    hospital_name string,
    address string,
    city string,
    state string,
    zip_code string,
    county_name string,
    phone_number string,
    hospital_type string,
    hospital_ownership string,
    emergency_services string,
    meets_criteria_EHRs string,
    hospital_overall_rating string,
    hospital_overall_rating_footnote string,
    mortality_national_comp string,
    mortality_national_comp_footnote string,
    safety_care_national_comp string,
    safety_care_national_comp_footnote string,
    readmin_national_comp string,
    readmin_national_comp_footnote string,
    patient_expr_national_comp string,
    patient_expr_national_comp_footnote string,
    effectiveness_care_national_comp string,    
    effectiveness_care_national_comp_footnote string,
    timeliness_care_national_comp string,
    timeliness_care_national_comp_footnote string,
    efficient_use_medImage_national_comp string,
    efficient_use_medImage_national_comp_footnote string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
    "separatorChar" = ',',
    "quoteChar" = '"',
    "escapeChar" = '\\' 
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

-- Timely and Effective Care 
DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
    provider_id string, 
    hospital_name string,
    address string,
    city string,
    state string,
    zip_code string,
    county_name string,
    phone_number string,
    condition string,
    measure_id string,
    measure_name string,
    score string,
    sample string,
    footnote string,
    measure_start_date string,
    measure_end_date string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
    "separatorChar" = ',',
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/care';

-- Readmissions and deaths
DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
    provider_id string, 
    hospital_name string,
    address string,
    city string,
    state string,
    zip_code string,
    county_name string,
    phone_number string,
    comp_to_national string,
    denominator string,
    score string,
    lower_estimate string,
    higher_estimate string,
    footnote string,
    measure_start_date string,
    measure_end_date string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
    "separatorChar" = ',',
    "quoteChar" = '"',
    "escapeChar" = '\\' 
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

-- Measures
DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
    measure_name string, 
    measure_id string,
    measure_start_quarter string,
    measure_start_date string,
    measure_end_quarter string,
    measure_end_date string,
    footnote string,
    footnote_text string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
    "separatorChar" = ',',
    "quoteChar" = '"',
    "escapeChar" = '\\' 
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

-- Survey Responses
DROP TABLE surveys;
CREATE EXTERNAL TABLE surveys
(
    comm_nurses_floor string, 
    comm_nurses_achievementThresh string,
    comm_nurses_benchmark string,
    comm_nurses_baselineRate string,
    comm_nurses_performanceRate string,
    comm_nurses_achievementPoints string,
    comm_nurses_improvementPoints string,
    comm_nurses_dimensionScore string,
    comm_doctors_floor string, 
    comm_doctors_achievementThresh string,
    comm_doctors_benchmark string,
    comm_doctors_baselineRate string,
    comm_doctors_performanceRate string,
    comm_doctors_achievementPoints string,
    comm_doctors_improvementPoints string,
    comm_doctors_dimensionScore string,
    responsiveness_hospStaff_floor string,
    responsiveness_hospStaff_achievementThresh string,
    responsiveness_hospStaff_benchmark string,
    responsiveness_hospStaff_baselineRate string,
    responsiveness_hospStaff_performanceRate string,
    responsiveness_hospStaff_achievementPoints string,
    responsiveness_hospStaff_improvementPoints string,
    responsiveness_hospStaff_dimensionScore string,
    pain_MGMT_floor string,
    pain_MGMT_achievementThresh string,
    pain_MGMT_benchmark string,
    pain_MGMT_baselineRate string,
    pain_MGMT_performanceRate string,
    pain_MGMT_achievementPoints string,
    pain_MGMT_improvementPoints string,
    pain_MGMT_dimensionScore string,
    comm_Medicines_floor string,
    comm_Medicines_achievementThresh string,
    comm_Medicines_benchmark string,
    comm_Medicines_baselineRate string,
    comm_Medicines_performanceRate string,
    comm_Medicines_achievementPoints string,
    comm_Medicines_improvementPoints string,
    comm_Medicines_dimensionScore string,
    cleanQuite_hospEnv_floor string,
    cleanQuite_hospEnv_achievementThresh string,
    cleanQuite_hospEnv_benchmark string,
    cleanQuite_hospEnv_baselineRate string,
    cleanQuite_hospEnv_performanceRate string,
    cleanQuite_hospEnv_achievementPoints string,
    cleanQuite_hospEnv_improvementPoints string,
    cleanQuite_hospEnv_dimensionScore string,
    discharge_info_floor string,
    discharge_info_achievementThresh string,
    discharge_info_benchmark string,
    discharge_info_baselineRate string,
    discharge_info_performanceRate string,
    discharge_info_achievementPoints string,
    discharge_info_improvementPoints string,
    discharge_info_dimensionScore string,
    overall_rating_floor string,
    overall_rating_achievementThresh string,
    overall_rating_benchmark string,
    overall_rating_baselineRate string,
    overall_rating_performanceRate string,
    overall_rating_achievementPoints string,
    overall_rating_improvementPoints string,
    overall_rating_dimensionScore string,
    HCAHPS_base_score string,
    HCAHPS_consistency_score string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
    "separatorChar" = ',',
    "quoteChar" = '"',
    "escapeChar" = '\\' 
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';


