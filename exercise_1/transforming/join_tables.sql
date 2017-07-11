DROP TABLE combo_table;

CREATE TABLE c1 AS 
SELECT efc.provider_id AS e_pid,
efc.condition,
efc.measure_id,
efc.score,
efc.sample,
 hpc.*
FROM effective_care_clean efc 
LEFT JOIN hospitals_clean hpc 
ON efc.provider_id = hpc.provider_id;

CREATE TABLE c2 AS 
SELECT c1.*,
rc.score AS readmissions_score,
rc.lower_estimate,
rc.higher_estimate
FROM c1 
LEFT JOIN readmissions_clean rc
ON c1.provider_id = rc.provider_id;
DROP TABLE c1;

CREATE TABLE c3 AS
SELECT c2.*, sc.*
FROM c2
LEFT JOIN surveys_clean sc
ON c2.provider_id = sc.provider_number;
DROP TABLE c2;

CREATE TABLE combo_table AS
SELECT c3.*, 
mc.measure_name, 
mc.measure_start_quarter,
mc.measure_end_quarter
FROM c3
LEFT JOIN measures_clean mc
ON c3.measure_id = mc.measure_id;
DROP TABLE c3;



