DROP TABLE effective_care_clean; 

CREATE TABLE t1 AS
SELECT provider_id,
condition,
measure_id,
score,
sample
FROM effective_care
WHERE score NOT LIKE 'Not%';

CREATE TABLE t2 AS
SELECT *
FROM t1
WHERE score NOT LIKE '%High%';
DROP TABLE t1;

CREATE TABLE t3 AS
SELECT *
FROM t2
WHERE score NOT LIKE '%Med%';
DROP TABLE t2;

CREATE TABLE effective_care_clean AS
SELECT *
FROM t3
WHERE score NOT LIKE '%Low%';
DROP TABLE t3;

DROP TABLE surveys_clean;
CREATE TABLE surveys_clean AS 
SELECT provider_number,
    overall_rating_floor,
    overall_rating_achievementThresh,
    overall_rating_benchmark,
    overall_rating_baselineRate,
    overall_rating_performanceRate,
    overall_rating_achievementPoints,
    overall_rating_improvementPoints,
    overall_rating_dimensionScore,
    HCAHPS_base_score,
    HCAHPS_consistency_score
FROM surveys
WHERE HCAHPS_base_score NOT LIKE '%NOT%';


DROP TABLE hospitals_clean;
CREATE TABLE hospitals_clean AS
SELECT provider_id, 
hospital_name,
state,
hospital_type,
hospital_ownership,
emergency_services,
meets_criteria_ehrs,
hospital_overall_rating,
mortality_national_comp,
safety_care_national_comp,
readmin_national_comp,
patient_expr_national_comp,
patient_expr_national_comp_footnote,
effectiveness_care_national_comp,
timeliness_care_national_comp,
efficient_use_medimage_national_comp
FROM hospitals;


DROP TABLE readmissions_clean;
CREATE TABLE readmissions_clean AS 
SELECT provider_id,
score, 
lower_estimate,
higher_estimate 
FROM readmissions
WHERE score NOT LIKE '%NOT';


DROP TABLE measures_clean;
CREATE TABLE measures_clean AS 
SELECT measure_name,
measure_id,
measure_start_quarter,
measure_end_quarter
FROM measures;

