# NHS_Referral-to-Treatment_Waiting_Times_Analysis

Overview
An end-to-end analysis of simulated NHS waiting list data across 8 trusts and
8 specialties (Jan 2023 – Dec 2024), built to practise the full analyst
workflow: cleaning messy real-world-style data, querying it in SQL, and
visualising it in Power BI.
Business Questions
1.	How is the total waiting list trending over time?
2.	Which specialties have the longest waits and highest breach rates?
3.	Which trusts/regions are missing the 92% 18-week RTT standard?
4.	Where are "long waiters" concentrated?

Tools Used
Excel & Power Query (data cleaning) · SQL (validation & analysis) · Power BI
(data modelling, DAX, dashboard)

Process
Inspect the raw export in Excel and log data quality issues (inconsistent
text casing, mixed date formats, numbers stored as text, missing values,
duplicate rows, an impossible negative value).
Clean the data using Power Query: standardised trust/specialty names,
parsed dates into a proper date type, stripped commas from numeric fields,
handled missing values with a documented rule, removed duplicates.
Load & validate the cleaned data in SQL, running checks to confirm the
cleaning worked, then wrote analysis queries to answer each business
question directly. Visualise in Power BI: built a date table, DAX measures for KPIs like
% within 18 weeks, and a 3-page report (Overview / By Specialty / By
Trust & Region) with slicers for interactivity.

Key Findings
The total waiting list grew by 6.11% between Jan 2023 and Dec 2024.
ENT is the biggest problem area on both counts — highest volume over 18 weeks (283K) and highest over 52 weeks (33.6K). It's not just a large specialty with proportionally more long waiters; it tops both charts.
Cardiology and T&O round out the top 3 for volume in both categories — these three specialties are driving most of the backlog. 
All acute NHS hospital trusts and all regions in England are currently missing the constitutional 92% 18-week referral-to-treatment (RTT) standard 

Recommendation
the backlog is large, growing, and broad-based rather than concentrated in one region — but ENT, Cardiology, and T&O are the specialties to prioritize.


Powerbi Dashboard


[Overview page 1] (powerbi/screenshot_overview.png)
 <img width="572" height="321" alt="powerbi screenshot overview" src="https://github.com/user-attachments/assets/0b359743-d9dd-47b3-8e37-1bac2f138351" />


[Specialty page 2] (powerbi/screenshot_by_specialty.png)
 <img width="571" height="320" alt="powerbi screenshot by specialty" src="https://github.com/user-attachments/assets/3839d9f6-176e-4ce4-8482-ab88d1f09776" />


[Trust & Region page 3] (powerbi/screenshot_by_trust_and_region.png)
 
<img width="573" height="321" alt="powerbi screenshot by trust and region" src="https://github.com/user-attachments/assets/eea47246-3433-4d51-9738-4492fe035b45" />


Repo Structure
```
01-nhs-waiting-times/
├── README.md
├── project_brief.md
├── data/
│   ├── raw/nhs_waiting_times_raw.csv       # messy source data
│   └── clean/nhs_waiting_times_clean.csv   # your cleaned output goes here
├── sql/
│   ├── 01_nhs_create_check_table.sql
│   ├── 02_nhs_cleaning_validation_queries.sql
│   └── 03_nhs_analysis.sql
└── powerbi/
    └── nhs_waiting_times_dashboard.pbix    # add your finished file here
```


What This Project Demonstrates
Handling untidy real-world exports, defensible data-cleaning decisions
(documented, not just "deleted the row"), SQL for validation and analysis,
and building a Power BI report aimed at a non-technical stakeholder audience.
