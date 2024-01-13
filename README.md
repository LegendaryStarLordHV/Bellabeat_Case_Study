# :runner: Bellabeat Case Study (high-tech manufacturer)
This is the analysis for an imaginary company called Bellabeat, a high-tech manufacturer of health-focused products for women.

## About the Project
The goal of this project was to analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart
devices. I was asked to find out some trends in smart device usage and how these trends could help influence Bellabeat's marketing strategy.
For the project, I was provided with FitBit Fitness Tracker data.

![Screenshot of two initial graphs of the Tableau viz](![image](https://github.com/LegendaryStarLordHV/Bellabeat_Case_Study/assets/43511883/94ab9734-9163-46ff-a427-7b0687863088))

The most challenging part of the project was to prepare the data for analysis. The dataset consists of 18 files with data on 30 fitness tracker users. Before the analysis, I had to study the files, understand the data, and decide what exactly I needed for the work. I identified the discrepancies in the data and transformed some of the CSV files in order to perform the analysis. The hardest part of the preparation phase was figuring out the correct date and time format that would allow me to JOIN needed tables in SQL and transform the data accordingly. 

![Screenshot of Activity Type in Minutes by Day of the Week graph of the Tableau viz](https://github.com/LegendaryStarLordHV/Bellabeat_Case_Study/assets/43511883/e711859d-9248-4061-9370-ffa3e320d268)


## Used Instruments
- Excel
- SQL and BigQuery
- Tableau
  
For this project, I used Excel to quickly familiarize myself with the data and transform some of the files. For the exploratory data analysis and the actual data analysis, I used SQL.
I worked in BigQuery, which allowed me to upload files, create tables, and write and run SQL queries. For the visualization, I used Tableau.

## Terms and Definitions
- Lightly Active Minutes - total minutes spent in light activity.
- Very Active Minutes - total minutes spent in very active activity.
- Sedentary Minutes - total minutes spent in sedentary activity.
- Average Intensity - all the minute-level
intensity values that occurred within the hour
- Calories - total estimated energy expenditure (in
kilocalories)
- Steps - steps tracked by the activity tracker or entered by a participant for the given period
- Distance - average kilometers tracked

## Main Stages 
The project's implementation included the following main stages:
- After retrieving the dataset from Kaggle, I uploaded the files to Excel to quickly familiarize myself with the data. After studying the data, I identified the necessary transformations and performed them in Excel. Some of the files were too big for Excel, so I performed the transformations in Google Sheets.
-  Next, I uploaded the data to BigQuery and used SQL to query the needed data on users' daily and hourly activity, types of activity, weight groups, and sleep duration. Using this data, I identified different groups of users according to their weight and sleep duration. I also found out how these groups differ in various types of activities. The data also allowed me to gain insights into users' nap habits, intensity levels, and their variations during the week.
- The next step was to visualize the data. I used Tableau and created a simple yet effective dashboard that displayed visualizations of users' physical activity and sleep habits.
- Finally, I documented the whole process of the analysis, from obtaining the data and transforming it to creating the visualizations.
  
## Functions and Techniques
The following list represents some of functions and techniques utilized within the project:
- CASE Expression
- Nested queries in FROM clause
- LEFT JOIN
- TIMESTAMP_DIFF and FORMAT_TIMESTAMP
- REGEXP_CONTAINS
- TIME(TIMESTAMP_DIFF(MAX(date),MIN(date),HOUR),
  MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),MINUTE),60),
  MOD(MOD(TIMESTAMP_DIFF(MAX(date),MIN(date),SECOND),3600),60) ) AS time_sleeping

## Tableau Visualization
Here is the link to the visualization in Tableau: [visualization](https://public.tableau.com/app/profile/vlad.horbachenko/viz/BellabeatCaseStudy_17048766878430/Dashboard)

## Next Steps
The analysis provided insights into the users's daily activity and sleep patterns. It is worth mentioning that most of the data in the dataset relates to the metrics that are automatically collected by the tracker, such as steps, calories, distance, intensity, etc. There is also data that users have to enter manually. It includes weight, height, age, and gender. Among these four metrics, only weight is presented in the data set. The analysis showed that roughly 24% of the participants entered their weight data. To identify the reason for such a low percentage, a further in-depth analysis has to be made. It is also recommended to obtain the data that includes the other above-mentioned manually entered data. This will help us understand whether this phenomenon applies to all indicators. The additional analysis will make it possible for Bellabeat to utilize the insights to influence their marketing strategy and potentially improve their products.
