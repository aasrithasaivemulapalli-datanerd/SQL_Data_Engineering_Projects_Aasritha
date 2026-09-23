/*
Find the top 10 companies that have posted Data Engineer jobs in more than one country.

Return:

company_name
number_of_countries
total_data_engineer_jobs

Only include companies with jobs in 2 or more countries.*/

SELECT c.name,
       count(DISTINCT jpf.job_country) as number_of_countries,
       count(jpf.job_id) as total_data_engineer_jobs
FROM job_postings_fact jpf
JOIN company_dim c on c.company_id = jpf.company_id
WHERE job_title like '%Data engineer%'
GROUP BY c.name
HAVING COUNT(DISTINCT jpf.job_country) >= 2
order by total_data_engineer_jobs desc
limit 10;

/* output : ┌───────────────────────────┬─────────────────────┬──────────────────────────┐
│           name            │ number_of_countries │ total_data_engineer_jobs │
│          varchar          │        int64        │          int64           │
├───────────────────────────┼─────────────────────┼──────────────────────────┤
│ Upwork                    │                   2 │                      110 │
│ VirtualVocations          │                   2 │                       77 │
│ Dice                      │                   2 │                       63 │
│ Jobs via Dice             │                   2 │                       50 │
│ Confidential              │                   2 │                       50 │
│ Capgemini                 │                   8 │                       44 │
│ Diverse Lynx              │                   5 │                       40 │
│ Cognizant                 │                   5 │                       35 │
│ Tata Consultancy Services │                   8 │                       35 │
│ Fullstack Labs            │                   5 │                       33 │
└───────────────────────────┴─────────────────────┴──────────────────────────┘
  10 rows                                                          3 columns */