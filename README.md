# NHS Referral-to-Treatment (RTT) Waiting Times Analysis

## Overview
End-to-end analysis of simulated NHS waiting list data across 8 trusts and 8 specialties (Jan 2023 – Dec 2024). Built to practise the full analyst workflow: cleaning messy data, validating it in SQL, and visualising it in Power BI.

## Business Questions
1.	How is the total waiting list trending over time?
2.	Which specialties have the longest waits and highest breach rates?
3.	Which trusts/regions are missing the 92% 18-week RTT standard?
4.	Where are “long waiters” concentrated?

## Tools Used
Excel & Power Query (cleaning) · SQL (validation & analysis) · Power BI (data modelling, DAX, dashboard).

## 1. Database & Table Creation
•	Designed a SQL staging table matching the raw export’s structure (trust, specialty, month, wait bands, breaches, region)

•	Built 01_nhs_create_check_table.sql to create the table ahead of import.

## 2. Data Import
•	Imported the raw CSV export into the staging table.

•	Verified row counts and column mappings against the source file before starting any analysis.

## 3. 🔍 Data Exploration
•	Logged data quality issues: inconsistent text casing, mixed date formats, numbers stored as text, missing values, duplicate rows, and one impossible negative value.

•	Ran 02_nhs_cleaning_validation_queries.sql to confirm the scope of each issue before deciding how to fix it.

## 4. 🧹 Data Cleaning
•	Standardised trust/specialty names, parsed dates into a proper date type, and stripped commas from numeric fields in Power Query.

•	Handled missing values with a documented rule and removed duplicate rows.

•	Reloaded the cleaned data into SQL and re-ran the validation queries to confirm the cleaning worked.

## 5. 📊 Business Insights
•	Wrote 03_nhs_analysis.sql to answer each business question directly.

•	Built the Power BI model (date table, DAX measures) and a 3-page report — Overview / By Specialty / By Trust & Region — with slicers for interactivity.

## Key Findings
•	5.4M patient-wait records analysed; average wait 13.8 weeks; only ~65% of patients treated within 18 weeks.

•	The total waiting list grew 6.11% between Jan 2023 and Dec 2024.

•	ENT is the biggest problem area on both counts — highest volume over 18 weeks (283K) and over 52 weeks (33.6K). It’s not just a large specialty with proportionally more long waiters; it tops both charts.

•	Cardiology and T&O round out the top 3 for volume in both categories — these three specialties are driving most of the backlog.

•	Every acute NHS trust and every region in England is currently missing the constitutional 92% 18-week RTT standard.

## Recommendation
The backlog is large, growing, and broad-based rather than concentrated in one region, but there are clear priorities for action:

•	Prioritise ENT, Cardiology and T&O first — they drive the largest share of both the over-18-week and over-52-week backlog

•	Treat this as a system-wide issue rather than a trust-specific one, since every trust and region is missing the standard.

•	Monitor specialty-level breach rates monthly via the Power BI dashboard to track whether the backlog is narrowing.

## Power BI Dashboard

- [nhs_waiting_times_dashboard.pbix](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_waiting_times_dashboard.pbix)

## Overview
<img width="825" height="463" alt="image" src="https://github.com/user-attachments/assets/3e7c58d7-e187-4b7b-8f71-6b0a79c8c6e4" />
 
## By Specialty
 <img width="825" height="463" alt="image" src="https://github.com/user-attachments/assets/8ed208fe-2899-4fd2-8f0b-fec67a41c3ea" />

## By Trust & Region
 <img width="825" height="463" alt="image" src="https://github.com/user-attachments/assets/b6d0acba-8fb1-4a82-a802-df9ea8fadf83" />

## Repo Structure
└── nhs-waiting-times/

- [README.md](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/71fb01dedf59eb979b9ce9b61d571c74808718a1/README.md)
  
- [project\_brief.md](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/72f380c76ff8ae3bab993e15e99ffeaf23ca9d62/project_brief.md)



└── data/

- [nhs_waiting_times_raw](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_waiting_times_raw.csv)

- [nhs_waiting_times_clean](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_waiting_times_clean.csv)

└── sql/
- [nhs_create_check_table.sql](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_create_check_table.sql)

- [nhs_cleaning_validation_queries.sql](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_cleaning_validation_queries.sql)

- [nhs_analysis.sql](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_analysis.sql)


└── powerbi/

- [nhs_waiting_times_dashboard.pbix](https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/d6e3ea6dececb87178e2ecb0913d96e81066d7f2/nhs_waiting_times_dashboard.pbix)

## What This Project Demonstrates
Handling untidy real-world exports with defensible, documented data-cleaning decisions; SQL for validation and analysis; and a Power BI report built for a non-technical stakeholder audience.
