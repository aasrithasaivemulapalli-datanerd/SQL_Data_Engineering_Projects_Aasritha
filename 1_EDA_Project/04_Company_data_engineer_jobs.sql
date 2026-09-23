/*   
Write a SQL query that returns:
company_name
number_of_data_engineer_jobs
Show the top 10 companies with the highest number of Data Engineer job postings. */

SELECT jpf.company_id,
       c.name,
       count(jpf.job_id) as number_of_data_engineer_jobs,
FROM job_postings_fact as jpf
JOIN company_dim c on c.company_id = jpf.company_id
WHERE job_title like '%Data engineer%'
GROUP BY c.name, jpf.company_id
order by number_of_data_engineer_jobs desc
LIMIT 10;

/* Output : 

┌────────────┬─────────────────────────────────────────────┬──────────────────────────────┐
│ company_id │                    name                     │ number_of_data_engineer_jobs │
│   int32    │                   varchar                   │            int64             │
├────────────┼─────────────────────────────────────────────┼──────────────────────────────┤
│       8637 │ Upwork                                      │                          110 │
│      12414 │ VirtualVocations                            │                           77 │
│       5527 │ Free-Work (ex Freelance-info Carriere-info) │                           75 │
│       8606 │ JPMorgan Chase Bank, N.A.                   │                           63 │
│       9163 │ Dice                                        │                           63 │
│     319247 │ Infy Mexico                                 │                           62 │
│     607830 │ BI SOLUTIONS                                │                           60 │
│     277669 │ SPG Consulting                              │                           57 │
│      25926 │ Zoom                                        │                           55 │
│     165380 │ SOFTHQ INC                                  │                           54 │
└────────────┴─────────────────────────────────────────────┴──────────────────────────────┘
  10 rows                                                                       3 columns
  */