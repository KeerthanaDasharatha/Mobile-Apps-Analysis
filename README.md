## **Introduction** ##
This repository contains an exploratory data analysis (EDA) on mobile store Apps data using SQL and Tableau to analyze  and compare various mobile phones such as detailing  a rich collection of information on mobile applications, capturing critical details like app name, pricing, user ratings, and supported devices.
![image](https://github.com/user-attachments/assets/e7084a62-de20-4953-998c-3f6c8b7cba55)

## **Data** ##

**id** : A unique number for each app to identify it.

**app_name** : The name of the app.

**size_bytes** : The size of the app in bytes (how much space it takes up on your device).

**currency** : The type of money used to show the app’s price.

**price** : The price of the app. If it's free, it shows 0.

**rating_count_tot** : The total number of ratings the app has received from all users.

**rating_count_ver** : The number of ratings the app has received for its current version.

**user_rating** : The average rating (from 1 to 5 stars) that users have given the app overall.


**user_rating_ver** : The average rating  that users have given for the current version of the app.


**ver** : The version number of the app.

**cont_rating** : The age group the app is suitable for, like "Everyone," "Teen," or "Mature."

**prime_genre** : The main category or type of app, like "Games," "Education," or "Productivity."

**sup_devices_num** : The number of different types of devices supported.

**screenshot_num** : The number of screenshots available for the app, showing what it looks like.

**lang_sup_num** : The number of languages the app supports.

**vpp_lic** : This refers to whether the app has a Volume Purchase Program (VPP) license, often used for enterprise or educational app distribution.

## **Project Details** ##

1. Tool : PostgreSQL
 
2. Dataset dowloaded from kaggle

   > 7197 rows
   
   > 15 Columns
   
   > dara type : numeric & Varchar
   
3. Tableau

## **Key findings** ##

Total number of genres available: 23

More than half (3862) of the apps belong to the Games genre, followed by Entertainment (535) and Education (453)

There are more free apps (56.36 %) compared to paid apps (43.64 %)


There are 4 types of contents offered:
       4+ content rating (61.60 %)
       9+ content rating(13.71 %)
       12+ content rating (16.05 %)
       17+ content rating(8.64 %)
      
**Trending apps and genres by rating**

The average user rating of all apps is 3.53

Top 3 user rating of apps across all categories and by genre

       Productivity: 4.01
       Music: 3.98 
       Photo & Video: 3.80 
       
Top 3 Most expensive app with price

       LAMP Words For Life	(299.99)
       Proloquo2Go - Symbol-based AAC(249.99)
       KNFB Reader (99.99)

## **Tableau Representation** ##     

![image](https://github.com/user-attachments/assets/175ba1af-6f32-46c7-80d6-ad8ba7fc8159)

## **Conclusion** ##
Our analysis of the mobile App Store data  shows that Games and Entertainment apps are the dominant categories, with free apps leading in both downloads and user ratings. The study also highlights the importance of high-quality apps and user satisfaction for success.
