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


select * from app_store;


--- check the number of apps in datasets ---
select count(id) as app_count from app_store;


--- finding missing values ---
select count(*) as missingvalue from app_store
where app_name is null
OR user_rating is null
OR prime_genre is null


--- Get top-rated apps in a each category ---
select app_name, count (*) as app_count from app_store
group by app_name
order by app_count desc;


--- Number of apps per Gern ---
select prime_genre,count(*) as num_apps from app_store
group by prime_genre
order by num_apps desc;


-- What is the total user rating count of apps by genre? ---
SELECT 
	prime_genre, 
	SUM(rating_count_tot) as user_rating_count,
	RANK () OVER (ORDER BY SUM(rating_count_tot) DESC)
FROM app_store
GROUP BY 1;


-- Get top-rated apps in a specific category ---
select app_name,user_rating from app_store
where prime_genre = 'Games'
order by user_rating desc
limit 10;



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
Select 
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
Select 
	prime_genre,
	COUNT(CASE WHEN price = 0 THEN 'Free' ELSE NULL END) free_count,
	COUNT(CASE WHEN price > 0 THEN 'Paid' ELSE NULL END) paid_count,
	COUNT(price) total_count
from app_store
group by 1
order by 1)

Select 
	prime_genre, 
	free_count,
	CONCAT(ROUND(100.0 * free_count / total_count, 2), ' %') free_perc,
	paid_count, 
	CONCAT(ROUND(100.0 * paid_count / total_count, 2), ' %') paid_perc
from genre_stats;


-- Top rated app for each genre --
select * from(
select e.*,
rank()over(partition by prime_genre
order by user_rating desc,rating_count_tot desc) as rank
from app_store e) as x
where x.rank = 1

-- What is the most common app price by genre?

WITH price_stats AS (
SELECT 
	prime_genre, 
	price, 
	COUNT(price) price_count,
	DENSE_RANK () OVER (PARTITION BY prime_genre ORDER BY COUNT(price) DESC) ranking
FROM app_store
GROUP BY 1, 2)

SELECT 
	prime_genre, 
	price,
	price_count
FROM price_stats
WHERE ranking = 1;

-- Similarly, what is the least common app price by genre?

WITH price_stats AS (
SELECT 
	prime_genre, 
	price, 
	COUNT(price) price_count,
	DENSE_RANK () OVER (PARTITION BY prime_genre ORDER BY COUNT(price)) ranking
FROM app_store
GROUP BY 1, 2)

SELECT 
	prime_genre, 
	price,
	price_count
FROM price_stats
WHERE ranking = 1;

-- What is the most common content rating of apps by genre?

WITH genre_cont_rating AS (
SELECT
	prime_genre, 
	cont_rating, 
	COUNT(cont_rating) cont_rating_count,
	DENSE_RANK () OVER (PARTITION BY prime_genre ORDER BY COUNT(cont_rating) DESC) ranking
FROM app_store
GROUP BY 1, 2)

Select
	prime_genre, 
	cont_rating, 
	cont_rating_count
FROM genre_cont_rating
WHERE ranking = 1
ORDER BY 1;
