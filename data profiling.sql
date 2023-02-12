Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table =10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =10000-primary key: id 
ii. Hours = 1562-primary key: business_id
iii. Category =2643-primary key: business_id
iv. Attribute =1115-primary key: business_id
v. Review =10000-primary key: id, 8090-foreign key: business_id, 9581-foreign key: user_id
vi. Checkin =493- primary key: business_id
vii. Photo =10000- primary key: id, 6493-foreign key: business_id
viii. Tip =3979- foreign key: business_id, 537-foreign key: user_id 
ix. User =10000-primary key: id 
x. Friend =11-foreign key: user_id
xi. Elite_years =2780-foreign key: user_id

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

Answer: No
	
   SQL code used to arrive at answer:
SELECT *
FROM user
WHERE id IS NULL AND name IS NULL AND review_count IS NULL AND yelping_since IS NULL AND useful IS NULL AND funny IS NULL AND cool IS NULL AND fans IS NULL AND average_stars IS NULL AND compliment_hot IS NULL AND compliment_more IS NULL AND compliment_profile IS NULL AND compliment_cute IS NULL AND compliment_list IS NULL AND compliment_note IS NULL AND compliment_plain IS NULL AND compliment_cool IS NULL AND compliment_funny IS NULL AND compliment_writer IS NULL AND compliment_photos IS NULL

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1		max:5		avg:3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0		avg:3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg:24.2995

5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
SELECT city, SUM(review_count) AS reviews
FROM business
GROUP BY city
ORDER BY reviews DESC

	
	Copy and Paste the Result Below:
+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+	
	
6. Find the distribution of star ratings to the business in the following cities:
i. Avon

SQL code used to arrive at answer:
SELECT stars, COUNT(review_count) AS count
FROM business 
WHERE city = 'Avon'
GROUP BY stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:
SELECT stars, COUNT(review_count) AS count
FROM business 
WHERE city = 'Beachwood'
GROUP BY stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+
		
7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
SELECT name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3

		
Copy and Paste the Result Below:
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+

8. Does posing more reviews correlate with more fans? No

	Please explain your findings and interpretation of the results:
+--------------+------+
| review_count | fans |
+--------------+------+
|         2000 |  253 |
|         1629 |   50 |
|         1339 |   76 |
|         1246 |  101 |
|         1215 |  126 |
|         1153 |  311 |
|         1116 |   16 |
|         1039 |  104 |
|          968 |  497 |
|          930 |  173 |
|          904 |   38 |
|          864 |   43 |
|          862 |  124 |
|          861 |  115 |
|          842 |   85 |
|          836 |   37 |
|          834 |  120 |
|          813 |  159 |
|          775 |   61 |
|          754 |   78 |
|          702 |   35 |
|          696 |   10 |
|          694 |  101 |
|          676 |   25 |
|          675 |   45 |
+--------------+------+
From the tables above, the fans and review count are not correlated, an increase in the review count does not affect or determine an increase in the fans count, so posting more reviews does not yield an increase in the fans count.

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
There are more reviews with the word “love” which has 1780 counts than the word “hate” which has 232 counts
	
	SQL code used to arrive at answer:
SELECT COUNT(*) AS love
FROM review
WHERE text LIKE '%love%' 

SELECT COUNT(*) AS love
FROM review
WHERE text LIKE '%hate%' 
		
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
SELECT name, fans
FROM user
ORDER BY fans DESC
LIMIT 10

	
	
	Copy and Paste the Result Below:
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+

	
Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Yes the groups have different distribution of hours

ii. Do the two groups you chose to analyze have a different number of reviews?
Yes there are different number of reviews, Desert Medical Equipment with 5.0 stars has 4 reviews count, Red Rock Canyon Visitor Center with 4.5 stars has 32 reviews count, Walgreens with 2.5 stars has 6 reviews count.

                  
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
No I am not able to infer anything from the location dataset provided due to limited information on the location, although while the opening hours are quite different the difference in reviews may be due to other factors like the customer service, the prices of goods, quality of the goods and so on.



SQL code used for analysis:
SELECT b.name, c.category, b.city, b.stars, h.hours, b.review_count, b.postal_code
FROM business b INNER JOIN category c 
ON b.id = c.business_id
INNER JOIN hours h ON b.id=h.business_id
WHERE b.city = 'Las Vegas' AND c.category = 'Shopping'
AND (stars>=4 OR (stars <3 AND stars>2))
ORDER BY stars DESC	
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1: The businesses that are opened have higher review counts than the businesses that are closed
         
         
ii. Difference 2: The opened businesses has a higher average rating than the closed businesses
         
         
         
SQL code used for analysis:
SELECT

    COUNT(DISTINCT(id)) AS Business_count,
    ROUND(AVG(review_count),2) AS avg_reviews,
    SUM(review_count) AS total_reviews,
    ROUND(AVG(stars),2) AS avg_ratings,
    is_open

FROM business
GROUP BY is_open

+----------------+-------------+---------------+-------------+---------+
| Business_count | avg_reviews | total_reviews | avg_ratings | is_open |
+----------------+-------------+---------------+-------------+---------+
|           1520 |        23.2 |         35261 |        3.52 |       0 |
|           8480 |       31.76 |        269300 |        3.68 |       1 |
+----------------+-------------+---------------+-------------+---------+


	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i.	Indicate the type of analysis you chose to do:
To know if there is a correlation between the categories and reviews in Las Vegas 
         
         
ii.	Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
I need the category, city and review_count and stars from the category and business table.
                           
                  
Output of your finished dataset:
+---------------------------------+-------+-----------+-------------------
| category                        | stars | city      | total_review_count |
+---------------------------------+-------+-----------+-------------------
| Beauty & Spas                   |   5.0 | Las Vegas |                  9 
| Chiropractors                   |   5.0 | Las Vegas |                  5 
| Doctors                         |   5.0 | Las Vegas |                 21 
| Hair Salons                     |   5.0 | Las Vegas |                  3 
| Health & Medical                |   5.0 | Las Vegas |                 36 
| Heating & Air Conditioning/HVAC |   5.0 | Las Vegas |                  7 
| Medical Supplies                |   5.0 | Las Vegas |                  4 
| Pain Management                 |   5.0 | Las Vegas |                  5 
| Physical Therapy                |   5.0 | Las Vegas |                  5 
| Shopping                        |   5.0 | Las Vegas |                 53 
| Solar Installation              |   5.0 | Las Vegas |                  7 
| Active Life                     |   4.5 | Las Vegas |                 32 
| Community Service/Non-Profit    |   4.5 | Las Vegas |                 32 
| Education                       |   4.5 | Las Vegas |                 32 
| Flowers & Gifts                 |   4.5 | Las Vegas |                 32 
| Gift Shops                      |   4.5 | Las Vegas |                 32 
| Hiking                          |   4.5 | Las Vegas |                 32 
| Hotels & Travel                 |   4.5 | Las Vegas |                 51 
| Japanese                        |   4.5 | Las Vegas |                  3 
| Local Services                  |   4.5 | Las Vegas |                 32 
| Parks                           |   4.5 | Las Vegas |                 32 
| Professional Services           |   4.5 | Las Vegas |                 32 
| Restaurants                     |   4.5 | Las Vegas |               1062 
| Special Education               |   4.5 | Las Vegas |                 32 
| Travel Services                 |   4.5 | Las Vegas |                 32 
+---------------------------------+-------+-----------+-------------------       


iii.	Provide the SQL code you used to create your final dataset:
SELECT c.category, b.stars, b.city, SUM(b.review_count) AS total_review_count
FROM business b INNER JOIN category c
ON b.id=c.business_id
WHERE city IS 'Las Vegas'
GROUP BY category
ORDER BY stars DESC



