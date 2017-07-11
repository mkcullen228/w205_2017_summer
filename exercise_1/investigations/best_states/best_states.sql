SELECT state, AVG(score) as avg_score 
FROM combo_table 
WHERE sample >= 100 AND score IS NOT NULL 
GROUP BY state 
ORDER BY avg_score 
DESC LIMIT 10;

