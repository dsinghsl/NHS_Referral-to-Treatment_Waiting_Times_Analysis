-- Q1: How is the total waiting list trending month on month?
SELECT
    reporting_month,
    SUM(patients_waiting) AS total_patients_waiting
FROM nhs_waiting_times_clean
GROUP BY reporting_month
ORDER BY reporting_month;

-- Q2a: Which specialties have the longest average median wait?
SELECT specialty,
ROUND(AVG(median_wait_weeks), 1) AS avg_median_wait_weeks
FROM nhs_waiting_times_clean
GROUP BY specialty
ORDER BY avg_median_wait_weeks DESC;

-- Q2b: Which specialties have the highest share of long waiters (18+ / 52+ weeks)?
SELECT
    specialty,
    SUM(number_waiting_over_18_weeks) AS total_over_18wk,
    SUM(number_waiting_over_52_weeks) AS total_over_52wk,
    SUM(patients_waiting)             AS total_waiting,
    ROUND(100.0 * SUM(number_waiting_over_18_weeks) / SUM(patients_waiting), 1) AS pct_over_18wk,
    ROUND(100.0 * SUM(number_waiting_over_52_weeks) / SUM(patients_waiting), 1) AS pct_over_52wk
FROM nhs_waiting_times_clean
GROUP BY specialty
ORDER BY pct_over_52wk DESC;

-- Q3: Which trusts are consistently missing the 92% RTT standard?
SELECT
    trust_name,
    region,
    COUNT(*) AS months_reported,
    SUM(CASE WHEN rtt_18wk_standard_met = 'No' THEN 1 ELSE 0 END) AS months_missed,
    ROUND(100.0 * SUM(CASE WHEN rtt_18wk_standard_met = 'No' THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_months_missed
FROM nhs_waiting_times_clean
GROUP BY trust_name, region
ORDER BY pct_months_missed DESC;

-- Q3b: Same, broken down by region
SELECT
    region,
    COUNT(*) AS months_reported,
    SUM(CASE WHEN rtt_18wk_standard_met = 'No' THEN 1 ELSE 0 END) AS months_missed,
    ROUND(100.0 * SUM(CASE WHEN rtt_18wk_standard_met = 'No' THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_months_missed
FROM nhs_waiting_times_clean
GROUP BY region
ORDER BY pct_months_missed DESC;

-- Q4: Are 52-week+ long waiters concentrated in a few trusts?
SELECT
    trust_name,
    SUM(number_waiting_over_52_weeks) AS total_52wk_plus,
    ROUND(100.0 * SUM(number_waiting_over_52_weeks) /
        (SELECT SUM(number_waiting_over_52_weeks) FROM nhs_waiting_times_clean), 1) AS pct_of_all_52wk_waiters
FROM nhs_waiting_times_clean
GROUP BY trust_name
ORDER BY total_52wk_plus DESC;

-- Q5: Trend check - has each trust's waiting list grown or shrunk from
-- the first reported month to the last? (simple start-vs-end comparison,
-- a stronger version of this is done visually in Power BI with a trend line)
WITH first_last AS (
    SELECT
        trust_name,
        MIN(reporting_month) AS first_month,
        MAX(reporting_month) AS last_month
    FROM nhs_waiting_times_clean
    GROUP BY trust_name
)
SELECT
    f.trust_name,
    s.patients_waiting AS start_waiting,
    e.patients_waiting AS end_waiting,
    e.patients_waiting - s.patients_waiting AS change,
    ROUND(100.0 * (e.patients_waiting - s.patients_waiting) / s.patients_waiting, 1) AS pct_change
FROM first_last f
JOIN nhs_waiting_times_clean s ON s.trust_name = f.trust_name AND s.reporting_month = f.first_month
JOIN nhs_waiting_times_clean e ON e.trust_name = f.trust_name AND e.reporting_month = f.last_month
ORDER BY pct_change DESC;


