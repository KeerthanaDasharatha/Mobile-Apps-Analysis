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

## **Exploratory Data Analysis** ##

**Number of Apps and missing value in data set**

The number of ID is the same (7197), so that there is no missing data

**Top-rated apps in a each category**

 Total number of genres available: 23

 According to number apps More than half (3862) of the apps belong to the Games genre, followed by Entertainment (353) and Education (453)


## **Number of Apps per Genre** ##

Most popular genre: Games is the most popular genre with 3862 apps, followed by Entertainment with 535 apps

Distribution: The number of apps varies greatly across genres, with Games having significantly more apps than most other genres

Less popular genres: Some genres have relatively few apps, such as Catalogs with only 10 apps

Potential for further analysis: This data could be used to further analyze app trends, user preferences, and market saturation in different genres.

 **total user rating count of apps by genre?**

 **top-rated apps in a specific category**

 **the average user rating of apps across all categories and by genre?**
 
 **the count and percentage of free and paid apps for all categories?**
 
 There are more free apps (56.36 %) compared to paid apps (43.64 %)

 **Top rated app for each genre**
 
 **User Ratings**: All Highly Rated Apps. Every app listed has a user rating of 5, indicating a high level of user satisfaction across diverse genres, This suggests that users are generally finding apps that meet their needs and expectations.
 
**Variety of Genres Represented**: The output includes apps from 20 different genres, showcasing a wide range of interests and needs being met, This demonstrates the breadth of the app market and the potential to cater to diverse user preferences.

**Specific App Highlights**: Popular and Practical Apps: Productivity apps (VPN Proxy Master), financial apps (Credit Karma), and health and fitness apps (Yoga Studio) are among the highly rated options, suggesting their practical value to users, Entertainment and Lifestyle: Entertainment apps (Bruh-Button, Head Soccer) and lifestyle apps (ipsy, We Heart It) also have high ratings, reflecting their ability to engage and connect with users, Niche Categories: Even niche genres like Catalogs (CPlus for Craigslist) and Medical (Blink Health) have top-rated apps, indicating opportunities for success in specialized areas.
