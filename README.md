# Bellabeat Case Study (high-tech manufacturer)
This is the analysis for an imaginary company called Bellabeat, a high-tech manufacturer of health-focused products for women.

## About the Project
The goal for this project was to  analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart
devices. I was asked to find out some trends in smart device usage and how could these trends help influence Bellabeat marketing strategy.
For the project, I was provided with the FitBit Fitness Tracker Data.

![Screenshot of two initial graphs of the Tableau viz](https://github.com/LegendaryStarLordHV/Bellabeat_Case_Study/assets/43511883/b8f25a34-d820-42c3-b679-490aec96f18a)

The most challenging part of the project was to prepare the data for analysis. The dataset consists of 18 files with data on 30 fitness tracker users. Before the analysis, I had to study the files, understand the data, and decide what exactly I needed for the work. I identified the discrepancies in the data and transformed some of the CSV files in order to perform the analysis. The hardest part of the preparation phase was to figure out the correct date and time format that would allow me to JOIN needed tables in SQL and transform the data accordingly. 

## Used Instruments
- Excel
- SQL and BigQuery
- Tableau
  
For this project, I used Excel to quickly familiarize myself with the data and transform some of the files. For the exploratory data analysis and actual data an actual data analysis I used SQL.
I worked in BigQuery which allowed me to upload files, create tables, and write and run SQL queries. For the visualization, I used Tableau.

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
The project implementation included the following main stages:
- After retrieving the dataset from Kaggle, I uploaded the files to Excel to quickly familiarize myself with the data. After studying the data, I identified the necessary transformations and performed them in Excel. Some of the files were too big for Excel, so I performed the transformations in Google Sheets.
-  Next, I uploaded the data to BigQuery and used SQL to query the needed data on users' daily and hourly activity, types of activity, weight groups, and sleep duration. Using this data, I identified different groups of users according to their weight and sleep duration. I also found out how these groups differ in various types of activities. The data also allowed me to gain insights into users' nap habits, intensity levels, and their variations during the week.
- The next step was to visualize the data. I used Tableau and created a simple yet effective dashboard that displayed visualizations of users' physical activity and sleep habits.
- Finally, I documented the whole process of the analysis, from obtaining the data and transforming it to creating the visualizations.
  
