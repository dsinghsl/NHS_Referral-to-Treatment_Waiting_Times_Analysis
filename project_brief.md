[project_brief.md](https://github.com/user-attachments/files/31879580/project_brief.md)
# Project Brief: NHS Referral-to-Treatment (RTT) Waiting Times Analysis


## Objective

Every month trusts report how many patients are waiting for treatment, how long they have
waited, and whether they are being seen within the NHS's 18-week Referral to
Treatment (RTT) standard. Leadership wants a clear picture of where waiting
lists are growing, which specialties are under the most pressure, and which
trusts are missing the 92% standard, so they can target support.

Turn two years of messy, trust-level waiting list data into a clean dataset,
a set of SQL queries that answer specific performance questions, and a
Power BI dashboard that lets a non-technical audience explore the results.



## Business Questions to Answer

1. How has the total number of patients waiting changed month by month, and
is the list growing or shrinking?
2. Which specialties have the longest median waits and the highest share of
patients waiting over 18 and over 52 weeks?
3. Which trusts are consistently missing the 92% RTT standard, and how does
this vary by region?
4. Are long waits (52+ weeks) concentrated in a small number of trusts/specialties,
or spread evenly?
5. If current trends continue, which trusts/specialties are most at risk of
breaching the standard next?



## Dataset

`data/raw/nhs_waiting_times_raw.csv` — synthetic, trust-level monthly RTT data
covering 8 fictional NHS trusts across 8 specialties, January 2023 to
December 2024 (\~1,550 rows).



* Cleaned dataset (Excel or CSV)
* SQL scripts: table creation, cleaning/validation queries, analysis queries
* A Power BI dashboard (.pbix) with at least 3 visuals answering the business
questions above, plus written insights



## Tools

Excel (initial inspection \& Power Query cleaning), SQL (SQLite Server — any engine you're comfortable with), Power BI (modelling, DAX, visualisation)

https://github.com/dsinghsl/NHS_Referral-to-Treatment_Waiting_Times_Analysis/blob/fa8a3fc932ae7c19d4051ce44aac60d5a8677ce3/README.md


