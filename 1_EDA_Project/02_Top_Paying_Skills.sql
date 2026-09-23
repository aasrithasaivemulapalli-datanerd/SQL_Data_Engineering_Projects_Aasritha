/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT 
     sd.skills,
     round(median(jpf.salary_year_avg),0) as median_salary,
     count(jpf.*) as demand_count
FROM job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd 
      ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd 
      ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Engineer' and job_work_from_home = 'true'
GROUP BY sd.skills 
HAVING count(jp.*) > 100
ORDER BY median_salary desc
LIMIT 20;


