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

/* output : ┌─────────────────────────────────────────────┬─────────────────────┬──────────────────────────┐
│                    name                     │ number_of_countries │ total_data_engineer_jobs │
│                   varchar                   │        int64        │          int64           │
├─────────────────────────────────────────────┼─────────────────────┼──────────────────────────┤
│ Upwork                                      │                 110 │                      110 │
│ VirtualVocations                            │                  77 │                       77 │
│ Free-Work (ex Freelance-info Carriere-info) │                  75 │                       75 │
│ JPMorgan Chase Bank, N.A.                   │                  63 │                       63 │
│ Dice                                        │                  63 │                       63 │
│ Infy Mexico                                 │                  62 │                       62 │
│ BI SOLUTIONS                                │                  60 │                       60 │
│ SPG Consulting                              │                  57 │                       57 │
│ Zoom                                        │                  55 │                       55 │
│ SOFTHQ INC                                  │                  54 │                       54 │
└─────────────────────────────────────────────┴─────────────────────┴──────────────────────────┘
  10 rows                                                                            3 column */