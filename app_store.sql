CREATE TABLE app_store (
    id numeric NOT NULL,
    app_name character varying,
    size_bytes numeric,
    currency character varying,
    price numeric,
    rating_count_tot numeric,
    rating_count_ver numeric,
    user_rating numeric,
    user_rating_ver numeric,
    ver character varying ,
    cont_rating character varying,
    prime_genre character varying,
    sup_devices_num numeric,
    screenshot_num numeric,
    lang_sup_num numeric,
    vpp_lic numeric
);
SELECT * FROM app_store;

--- check the number of apps in datasets ---
SELECT COUNT(id) AS app_count FROM app_store;


--- finding missing values ---
SELECT COUNT(*) AS missingvalue FROM app_store
WHERE app_name is NULL
OR user_rating is NULL
OR prime_genre is NULL


--- Get top-rated apps in a each category ---
SELECT app_name, COUNT (*) AS app_count FROM app_store
GROUP BY app_name
ORDER BY app_count DESC;


--- Number of apps per Gern ---
SELECT prime_genre,COUNT(*) AS num_apps FROM app_store
GROUP BY prime_genre
ORDER BY num_apps DESC;


-- What is the total user rating count of apps by genre? ---
SELECT
	prime_genre, 
	SUM(rating_count_tot) AS user_rating_count,
	RANK () OVER (ORDER BY SUM(rating_count_tot) DESC)
FROM app_store
GROUP BY 1;


-- Get top-rated apps in a specific category ---
SELECT app_name,user_rating FROM app_store
WHERE prime_genre = 'Games'
ORDER BY user_rating DESC
LIMIT 10;


-- What is the average user rating of apps across all categories and by genre? --

SELECT 
	ROUND(AVG(user_rating), 2) avg_all
FROM app_store;

SELECT 
	prime_genre, 
	ROUND (AVG(user_rating), 2) user_rating_count,
	RANK () OVER (ORDER BY AVG(user_rating) DESC)
FROM app_store
GROUP BY 1;


-- What is the count and percentage of free and paid apps for all categories? --

WITH app_stats AS (
SELECT
	COUNT(CASE WHEN price = 0 THEN 'Free' ELSE NULL END) free_count,
	COUNT(CASE WHEN price > 0 THEN 'Paid' ELSE NULL END) paid_count,
	COUNT(price) total_count
from app_store)

Select 
	free_count, 
	CONCAT(ROUND(100.0 * free_count / total_count, 2), ' %') free_perc,
	paid_count,
	CONCAT(ROUND(100.0 * paid_count / total_count, 2), ' %') paid_perc
from app_stats;


-- What is the proportion of free and paid apps by genre

WITH genre_stats AS (
SELECT 
	prime_genre,
	COUNT(CASE WHEN price = 0 THEN 'Free' ELSE NULL END) free_count,
	COUNT(CASE WHEN price > 0 THEN 'Paid' ELSE NULL END) paid_count,
	COUNT(price) total_count
FROM app_store
GROUP BY 1
ORDER BY 1
)

SELECT 
	prime_genre, 
	free_count,
	CONCAT(ROUND(100.0 * free_count / total_count, 2), ' %') free_perc,
	paid_count, 
	CONCAT(ROUND(100.0 * paid_count / total_count, 2), ' %') paid_perc
FROM genre_stats;


-- Top rated app for each genre --
SELECT * FROM(
SELECT e.*,
RANK()over(PARTITION BY prime_genre
ORDER BY user_rating desc,rating_count_tot DESC) AS rank
FROM app_store e) AS x
WHERE x.rank = 1

-- What is the content rating by count?

WITH content_count AS (
SELECT 
	cont_rating, 
	COUNT(cont_rating) cont_num,
	(SELECT COUNT(cont_rating) FROM app_store) total_num
FROM app_store
GROUP BY 1
ORDER BY 2)

SELECT 
	cont_rating, 
	cont_num,
	CONCAT (ROUND (100.0 * cont_num / total_num, 2) , ' %') percentage
FROM content_count
ORDER BY 2 DESC, 3 DESC;


-- What are the top 10 most expensive apps?
WITH price_rank AS (
SELECT 
	app_name,
	price,
	DENSE_RANK () OVER (ORDER BY price DESC) rnk
FROM app_store)

SELECT 
	app_name, 
	price
FROM price_rank
WHERE rnk BETWEEN 1 AND 10;

--What is the average number of devices supported, screenshot images, and languages supported by genre?
SELECT 
	prime_genre, 
	ROUND(AVG(sup_devices_num)) sup_devices_avg,
    ROUND(AVG(screenshot_num)) screenshot_avg,
	ROUND(AVG(lang_sup_num)) lang_sup_avg
FROM app_store
GROUP BY 1
ORDER BY 1;


-- app average rating and total number of ratings--
SELECT
MAX(user_rating)AS Max_rating,
MIN(user_rating)AS Min_rateing,
ROUND(AVG(user_rating),2)AS Avg_rateing FROM app_store




