SELECT table_name,
        column_name,
        data_type
FROM information_schema.columns
where table_name = 'job_postings_fact';

DESCRIBE job_postings_fact;

/* 
Output :
┌───────────────────┬───────────────────────┬───────────┐
│    table_name     │      column_name      │ data_type │
│      varchar      │        varchar        │  varchar  │
├───────────────────┼───────────────────────┼───────────┤
│ job_postings_fact │ job_id                │ INTEGER   │
│ job_postings_fact │ company_id            │ INTEGER   │
│ job_postings_fact │ job_title_short       │ VARCHAR   │
│ job_postings_fact │ job_title             │ VARCHAR   │
│ job_postings_fact │ job_location          │ VARCHAR   │
│ job_postings_fact │ job_via               │ VARCHAR   │
│ job_postings_fact │ job_schedule_type     │ VARCHAR   │
│ job_postings_fact │ job_work_from_home    │ BOOLEAN   │
│ job_postings_fact │ search_location       │ VARCHAR   │
│ job_postings_fact │ job_posted_date       │ TIMESTAMP │
│ job_postings_fact │ job_no_degree_mention │ BOOLEAN   │
│ job_postings_fact │ job_health_insurance  │ BOOLEAN   │
│ job_postings_fact │ job_country           │ VARCHAR   │
│ job_postings_fact │ salary_rate           │ VARCHAR   │
│ job_postings_fact │ salary_year_avg       │ DOUBLE    │
│ job_postings_fact │ salary_hour_avg       │ DOUBLE    │
└───────────────────┴───────────────────────┴───────────┘
  16 rows                                     3 columns

  */


  /* CAST */

Select cast( 123 as varchar);

select cast(job_id as varchar),
       cast(job_work_from_home as INT),
       cast(job_posted_date as date),
       cast(salary_year_avg as decimal(10,0))
from job_postings_fact
where salary_year_avg is not null
limit 5;

/* or can be written also as below*/

select job_id::varchar,
       job_work_from_home::INTEGER,
       job_posted_date::date,
       salary_year_avg::decimal(10,1)
from job_postings_fact
where salary_year_avg is not null
limit 5;
