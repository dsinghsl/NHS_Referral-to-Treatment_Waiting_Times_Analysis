
-- 1. Check for exact duplicate rows (should return 0 rows / no groups with count > 1)
SELECT Trust_Code, Specialty, Reporting_Month, COUNT(*) AS n
FROM nhs_waiting_times_clean
GROUP BY Trust_Code, Specialty, Reporting_Month
HAVING COUNT(*) > 1;

-- 2. Check trust names are standardised (should return exactly 8 distinct names)
SELECT DISTINCT Trust_Name 
FROM nhs_waiting_times_clean 
ORDER BY Trust_Name ASC;

-- 3. Check specialty names are standardised (should return exactly 8 distinct values)
SELECT DISTINCT	Specialty 
FROM nhs_waiting_times_clean 
ORDER BY Specialty ASC;

-- 4. Check for impossible negative values
SELECT *
FROM nhs_waiting_times_clean
WHERE patients_waiting < 0
  OR number_waiting_over_18_weeks < 0
  OR number_waiting_over_52_weeks < 0
  OR median_wait_weeks < 0;
   
   -- 5. Check for logically inconsistent rows (over-52-week patients can't exceed over-18-week patients)
SELECT *
FROM nhs_waiting_times_clean
WHERE number_waiting_over_52_weeks > number_waiting_over_18_weeks;

-- 6. Check for NULLs in columns that shouldn't have them post-cleaning
SELECT
    SUM(CASE WHEN trust_name IS NULL THEN 1 ELSE 0 END)      AS null_trust_name,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END)          AS null_region,
    SUM(CASE WHEN reporting_month IS NULL THEN 1 ELSE 0 END) AS null_month,
    SUM(CASE WHEN patients_waiting IS NULL THEN 1 ELSE 0 END) AS null_waiting
FROM nhs_waiting_times_clean;

-- 7. Sanity-check the date range (should be Jan 2023 - Dec 2024)
SELECT MIN(reporting_month) AS earliest, MAX(reporting_month) AS latest
FROM nhs_waiting_times_clean;

-- 8. Row count sanity check (8 trusts x 8 specialties x 24 months = 1,536 expected
SELECT COUNT(*) AS total_rows FROM nhs_waiting_times_clean;