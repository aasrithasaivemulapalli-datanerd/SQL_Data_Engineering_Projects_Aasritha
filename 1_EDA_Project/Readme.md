# Exploratory Data Analysis with SQL: Job Market Analytics for Data Engineer Roles

![Image](Images/1_1_Project1_EDA.png)

A SQL project analyzing the data engineer job market using real world job postings data.

## Executive Summary
- ✅ **Project scope**: Built 3 analytical queries that answer key questions about the data engineer job market
- ✅ **Data modeling**: Used multi-table joins across fact and dimension tables to extract insights
- ✅ **Analytics**: Applied aggregations, filtering, and sorting to find top skills by demand, salary, and overall value
- ✅ **Outcomes**: Delivered actionable insights on SQL/Python dominance, cloud trends, and salary patterns.

### Queries :

1. [`01_top_demanded_skills.sql`](01_top_demanded_skills.sql) – Identifies the 10 most in-demand skills for remote data engineer positions
2. [`02_top_paying_skills.sql`](02_Top_Paying_Skills.sql) – Analyzes the 20 highest-paying skills with salary and demand metrics
3. [`03_optimal_skills.sql`](03_Optimal_Skills.sql) – Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn
4. [`04_Company_data_engineer_jobs.sql`](1_EDA_Project/04_Company_data_engineer_jobs.sql) - Gives the top 10 companies who have posted the highest number of data engineer jobs


# Problem & Context

Job market analysts need to answer questions like:

- 🎯 Most in-demand: Which skills are most in-demand for data engineers?
- 💰 Highest paid: Which skills command the highest salaries?
- ⚖️ Best trade-off: What is the optimal skill set balancing demand and compensation?

This project analyzes a data warehouse built using a star schema design. The warehouse structure consists of:

**Fact Table** : `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc.)

**Dimension Tables**:
`company_dim` - Company information linked to job postings
`skills_dim` - Skills catalog with skill names and types

**Bridge Table**: `skills_job_dim` - Resolves the many-to-many relationship between job postings and skills
By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.

By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.

# Tech Stack
- 🐤 Query Engine: DuckDB for fast OLAP-style analytical queries
- 🧮 Language: SQL (ANSI-style with analytical functions)
- 📊 Data Model: Star schema with fact + dimension + bridge tables
- 🛠️ Development: VS Code for SQL editing + Terminal for DuckDB CLI
- 📦 Version Control: Git/GitHub for versioned SQL scripts

# Analysis Overview

## Key Insights
- 🧠 Core languages: SQL and Python each appear in ~29,000 job postings, making them the most demanded skills
- ☁️ Cloud platforms: AWS and Azure are critical for modern data engineering roles-
- 🧱 Infra & tooling: Kubernetes, Docker, and Terraform are associated with premium salaries
- 🔥 Big data tools: Apache Spark shows strong demand with competitive compensation