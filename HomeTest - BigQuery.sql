-- Question 1: There are 3 tables containing information about the artists, songs, and global_song_rank. (link data) 
-- Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the most.

WITH xxx AS (	
SELECT	
	a.artist_name,	
	count(s.song_id) AS count_songs	
FROM `test-case-interview-434918.testcase.artists` AS a	
JOIN `test-case-interview-434918.testcase.songs` AS s	
	ON a.artist_id = s.artist_id	
JOIN `test-case-interview-434918.testcase.global_song_rank` AS g	
	ON g.song_id = s.song_id	
WHERE g.rank <= 10	
GROUP BY a.artist_name	
),	
	
xxy AS (	
SELECT	
	artist_name,	
	dense_rank() over(order by count_songs desc) AS artist_rank	
FROM xxx	
)	
	
SELECT	
	artist_name,	
	artist_rank	
FROM xxy	
WHERE artist_rank <= 5	
ORDER BY artist_rank;	


---------------

-- Query 02: Find the lifetime total orders, total spent (GMV), unique items bought , earliest purchase date, last purchased date, 
--average amount spent per order (AOV) and average purchase price (APP) for the following buyer IDs and their purchased products’ categories:
-- 1076216361964070
--  3190859517651870
--  3754202390878020

WITH xxx AS (
SELECT
	mot.customer_id,
	dim.category,
	count(distinct mot.order_id) AS total_orders,
	sum(mot.gmv) AS total_spend,
	count(distinct mot.product_id) AS unique_items,
	min(mot.order_date) AS earliest_date,
	max(mot.order_date) AS last_date,
	sum(mot.price) AS total_price
FROM `test-case-interview-434918.testcase.my_order_trans` AS mot
JOIN `test-case-interview-434918.testcase.dim_product` AS dim
	ON mot.product_id = dim.product_id
JOIN `test-case-interview-434918.testcase.my_buyer_profile` AS mbp
	ON mot.customer_id = mbp.customer_id
WHERE mot.customer_id IN (1076216361964070, 3190859517651870, 3754202390878020)
GROUP BY mot.customer_id, dim.category
)

SELECT
	customer_id,
	category,
	total_orders,
	total_spend,
	unique_items,
	earliest_date,
	last_date,
	round(avg(total_spend / total_orders)) as AOV,
	round(avg(total_price / total_orders)) as APP
FROM xxx
GROUP BY customer_id, category, total_orders, total_spend, unique_items, earliest_date,last_date


---------------

-- Query 03: Find out the top 10 cross border items with the highest quantity sold. The output includes minimum selling price, total spent (gmv) and total orders. 

WITH xxx AS (	
SELECT	
	dim.product_name AS productname,	
	dim.category AS productcategory,	
	min(mot.price) AS min_price,	
	sum(mot.qty_sold) AS total_sold,	
	sum(mot.gmv) AS total_gmv,	
	count(distinct mot.order_id) AS total_order	
FROM `test-case-interview-434918.testcase.my_order_trans` AS mot	
JOIN `test-case-interview-434918.testcase.dim_product` AS dim	
	ON mot.product_id = dim.product_id	
WHERE mot.is_crossborder = 1 and LOWER(mot.order_status) LIKE '%success%'	
#BigQuery cannot recognize ILIKE so use LOWER combined with LIKE	
GROUP BY dim.product_name, dim.category,mot.qty_sold	
),	
	
xxy AS (	
SELECT *,	
	row_number() over(order by total_sold desc) as rank	
FROM xxx	
)	
	
SELECT *	
FROM xxy	
WHERE rank <= 10;	


---------------


-- Query 04: Find the average time (in day unit) between customer’s first and second checkout 
--(for example avg. time is 3.4 day which is calculated for average metric of all customer base)

WITH xxx AS (
SELECT
	customer_id,
	order_date,
	row_number() over(partition by customer_id order by order_date) AS order_count
FROM `test-case-interview-434918.testcase.my_order_trans` AS mot
WHERE LOWER(order_status) LIKE '%success%'
),

rank_order AS (
SELECT
	customer_id,
	max(case when order_count = 1 then order_date end) AS first_date,
	max(case when order_count = 2 then order_date end) AS second_date
FROM xxx
WHERE order_count <= 2
GROUP BY customer_id
HAVING second_date is not null
)

SELECT
	avg(date_diff(second_date, first_date, DAY)) AS avg_date_diff
FROM rank_order;