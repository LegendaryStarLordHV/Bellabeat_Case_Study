--EXPLORATORY DATA ANALYSIS

--Check total number of tables in the dataset

SELECT
  COUNT(table_name) AS number_of_tables
FROM
  `my-data-project-1-404808.case_study.INFORMATION_SCHEMA.TABLES`;

--Check which column names are shared across all the tables

SELECT
  column_name,
  COUNT(column_name)
FROM
  `my-data-project-1-404808.case_study.INFORMATION_SCHEMA.COLUMNS`
GROUP BY
  column_name;

--Check if each table has Id column

SELECT
  table_name,
  SUM(CASE
        WHEN column_name = "Id" THEN 1
        ELSE 0
      END
      ) AS has_id_column
FROM
  `my-data-project-1-404808.case_study.INFORMATION_SCHEMA.COLUMNS`
GROUP BY
  table_name;

--The dataset represents data on physical activity
--Check if all the tables have a column of a date or time related type 

SELECT
  table_name,
  SUM(CASE
        WHEN data_type IN ("TIMESTAMP", "DATETIME", "TIME", "DATE") THEN 1
        ELSE 0
        END
    ) AS has_time_info
FROM
  `my-data-project-1-404808.case_study.INFORMATION_SCHEMA.COLUMNS`
WHERE
  data_type IN ("TIMESTAMP","DATETIME","DATE")
GROUP BY
  table_name;

-- Check to see if column names have any of the keywords below:
-- date, minute, daily, hourly, day, seconds

SELECT
  table_name,
  column_name
FROM
  `my-data-project-1-404808.case_study.INFORMATION_SCHEMA.COLUMNS`
WHERE
  REGEXP_CONTAINS(LOWER(column_name), "date|minute|daily|hourly|day|seconds");

--Check the number of unique users in the daily_activity table (main table)

SELECT
  COUNT(Id) AS unique_values
FROM
  `my-data-project-1-404808.case_study.daily_activity`; 


--DATA ANALYSIS

/* Say we are considering sleep related products as a possibility, let's take a
   moment to see if/ how people nap during the day
   To do this we are assuming that a nap is any time someone sleeps but goes to sleep
   and wakes up on the same day
*/

SELECT
  Id,
  sleep_start AS sleep_date,
  COUNT(logId) AS number_naps,
  SUM(EXTRACT(HOUR
  FROM
  time_sleeping)) AS total_time_sleeping
FROM (
  SELECT  
    Id,
    logId,
    MIN(DATE(date)) AS sleep_start,
    MAX(DATE(date)) AS sleep_end,
    TIME(TIMESTAMP_DIFF(MAX(date),MIN(date),HOUR),
    MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),MINUTE),60),
    MOD(MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),SECOND),3600),60) ) AS time_sleeping
  FROM
    `my-data-project-1-404808.case_study.minute_sleep`
  WHERE
    value=1
  GROUP BY
    Id,
    logId
)
WHERE
  sleep_start = sleep_end
GROUP BY
  Id,
  sleep_date
ORDER BY
  number_naps DESC;

--Hourly activity according to the day of the week and part of the week

SELECT
  Id,
  FORMAT_TIMESTAMP("%A", ActivityHour) AS day_of_week,
  CASE
    WHEN FORMAT_TIMESTAMP("%A", ActivityHour) IN ("Sunday", "Saturday") THEN
    "Weekend"
    WHEN FORMAT_TIMESTAMP("%A", ActivityHour) NOT IN ("Sunday",
    "Saturday") THEN "Weekday"
    ELSE "ERROR"
  END AS part_of_week,
  AVG(TotalIntensity) AS avg_intensity_per_hour
FROM
  `my-data-project-1-404808.case_study.hourly_intensities`
GROUP BY
  Id,
  day_of_week,
  part_of_week;

--Daily activity with sleep duration

SELECT
  sd.Id,
  da.ActivityDate,
  sd.TotalMinutesAsleep / 60 AS SleepDuration,
  da.TotalSteps,
  da.TotalDistance,
  da.Calories,
  da.VeryActiveMinutes,
  da.FairlyActiveMinutes,
  da.LightlyActiveMinutes,
  da.SedentaryMinutes
FROM (
  SELECT
    Id, 
    CAST(SleepDay AS DATE) AS sleep_day,
    TotalMinutesAsleep
  FROM
    `my-data-project-1-404808.case_study.sleep_day`
) AS sd
LEFT JOIN
   `my-data-project-1-404808.case_study.daily_activity` AS da
ON da.Id = sd.Id AND da.ActivityDate = sd.sleep_day;

--Daily activity based on sleep hours

SELECT
  CASE
    WHEN sd.TotalMinutesAsleep < 360 THEN 'less than 6h'
    WHEN sd.TotalMinutesAsleep BETWEEN 360 AND 480 THEN '6-8h'
    ELSE 'more than 8h'
  END AS sleep_duration,
  ROUND(AVG(da.TotalSteps)) AS avg_steps,
  ROUND(AVG(da.TotalDistance)) AS avg_distance,
  ROUND(AVG(da.Calories)) AS avg_calories,
  ROUND(AVG(da.VeryActiveMinutes)) AS avg_very_active_min,
  ROUND(AVG(da.FairlyActiveMinutes)) AS avg_fairly_active_min,
  ROUND(AVG(da.LightlyActiveMinutes)) AS avg_light_active_min,
  ROUND(AVG(da.SedentaryMinutes)) AS sedentary_min
FROM (
  SELECT
    Id, 
    CAST(SleepDay AS DATE) AS sleep_day,
    TotalMinutesAsleep
  FROM
    `my-data-project-1-404808.case_study.sleep_day`
) AS sd
LEFT JOIN
   `my-data-project-1-404808.case_study.daily_activity` AS da
ON da.Id = sd.Id AND da.ActivityDate = sd.sleep_day
GROUP BY
  sleep_duration
ORDER BY
  avg_steps DESC;

--Daily activity according to weight 

SELECT
   CASE
    WHEN wi.average_weight < 60 THEN 'less than 60kg'
    WHEN wi.average_weight BETWEEN 60 AND 80 THEN '60-80kg'
    ELSE 'more than 80kg'
  END AS weight,
  ROUND(AVG(da.TotalDistance)) AS avg_distance,
  ROUND(AVG(da.TotalSteps)) AS avg_steps,
  ROUND(AVG(da.Calories)) AS avg_calories,
  ROUND(AVG(da.VeryActiveMinutes)) AS avg_very_active_min,
  ROUND(AVG(da.FairlyActiveMinutes)) AS avg_fairly_active_min,
  ROUND(AVG(da.LightlyActiveMinutes)) AS avg_light_active_min,
  ROUND(AVG(da.SedentaryMinutes)) AS sedentary_min
FROM (
  SELECT
    Id,
    ROUND(AVG(WeightKg), 2) AS average_weight
  FROM
    `my-data-project-1-404808.case_study.weight_info`
  GROUP BY
    Id
) AS wi
LEFT JOIN
  `my-data-project-1-404808.case_study.daily_activity` da
ON wi.Id = da.Id
GROUP BY
  weight
ORDER BY
 avg_steps DESC,
 avg_distance DESC;

