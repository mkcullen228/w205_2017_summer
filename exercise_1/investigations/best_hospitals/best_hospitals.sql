SELECT provider_id, hospital_name, AVG(score) as avg_score
FROM combo_table 
WHERE sample >= 100 AND score IS NOT NULL
GROUP BY provider_id, hospital_name
ORDER BY avg_score  
DESC LIMIT 10;
