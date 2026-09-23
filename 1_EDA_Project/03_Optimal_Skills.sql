/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/

SELECT 
     sd.skills,round(median(jpf.salary_year_avg),0) as median_salary,
     count(jpf.salary_year_avg) as demand_count,
     median(jpf.salary_year_avg)*count(jpf.salary_year_avg) as optimal_score
FROM data_jobs.job_postings_fact as jpf
INNER JOIN data_jobs.skills_job_dim as sjd 
      ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd 
      ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Engineer' and job_work_from_home = 'true'
GROUP BY sd.skills 
HAVING count(jp.*) > 100
ORDER BY optimal_score desc
LIMIT 20;


