1) Write a query that returns the top 5 rows from orders ordered according to newest to oldest, 
but with the largest total_amt_usd for each date listed first for each date. You will notice each 
of these dates shows up as unique because of the time element. When you learn about truncating dates 
in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis.

SELECT * FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC
LIMIT 5;

2) Write a query that returns the top 10 rows from orders ordered according to oldest to newest, 
but with the smallest total_amt_usd for each date listed first for each date. You will notice each 
of these dates shows up as unique because of the time element. When you learn about truncating dates 
in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis.

SELECT * FROM orders
ORDER BY total_amt_usd DESC, occurred_at DESC
LIMIT 10;


3) Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd 
greater than or equal to 1000.

SELECT * FROM orders
WHERE gloss_amt_usd >=1000
LIMIT 5;

4) Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.

SELECT * FROM orders
WHERE gloss_amt_usd<500
LIMIT 15;

5) Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) 
for Exxon Mobil in the accounts table.

SELECT name, website, primary_poc
FROM accounts
WHERE name=='Exxon Mobil';

6) Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper 
for each order. Limit the results to the first 10 orders, and include the id and account_id fields. 

SELECT id,account_id ,standard_amt_usd/standard_qty  AS unit_price
FROM orders
LIMIT 10

7) Write a query that finds the percentage of revenue that comes from poster paper for each order.
 You will need to use only the columns that end with _usd. (Try to do this without using the total column). 
 Include the id and account_id fields.

SELECT id, account_id, 
poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders;

8) All the companies whose names start with 'C'.

SELECT *
FROM accounts
WHERE name LIKE 'C%'

9) All companies whose names contain the string 'one' somewhere in the name.


SELECT *
FROM accounts
WHERE name LIKE '%one%'

10) All companies whose names end with 's'.

SELECT *
FROM accounts
WHERE name LIKE '%s'

11) Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.

SELECT name,primary_poc,sales_rep_id 
FROM accounts
WHERE name IN ('Walmart','Target',"Nordstrom");

12) Use the web_events table to find all information regarding individuals 
who were contacted via the channel of organic or adwords.

SELECT * 
FROM web_events
WHERE channel IN ('organic','adwords');

13)		We can pull all of the rows that were excluded from the queries 
in the previous two concepts with our new operator.

SELECT * FROM accounts
WHERE name NOT IN ('Walmart','Target','Nordstrom');

14)    Use the accounts table to find the account name, primary poc, 
and sales rep id for all stores except Walmart, Target, and Nordstrom.

SELECT *
FROM web_events
WHERE channel NOT IN ('organic','adwords');

15)    Use the web_events table to find all information regarding individuals who were 
contacted via any method except using organic or adwords methods.

Use the accounts table to find:

16)    All the companies whose names do not start with 'C'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
17)    All companies whose names do not contain the string 'one'
 somewhere in the name.
SELECT *
FROM accounts
WHERE name NOT LIKE '%one%'
18)    All companies whose names do not end with 's'.

SELECT *
FROM accounts
WHERE name NOT LIKE '%s'

19)Write a query that returns all the orders where the standard_qty is over 1000,
 the poster_qty is 0, and the gloss_qty is 0.

SELECT * 
FROM orders
WHERE standard_qty>=1000 AND poster_qty=0 AND gloss_qty=0;

20) Using the accounts table find all the companies whose names 
do not start with 'C' and end with 's'.

SELECT * FROM accounts
WHERE name NOT LIKE 'C%' AND name NOT LIKE '%s'

21) Use the web_events table to find all information regarding individuals 
who were contacted via organic or adwords and started their account at any point in 2016 
sorted from newest to oldest.

SELECT * 
FROM web_events
WHERE channel IN ('organic','adwords') AND occured_at >='2016-1-1'
ORDER BY occured_at DESC;

22) Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. 
Only include the id field in the resulting table.

SELECT id
FROM orders
WHERE gloss_qty>4000 OR poster_qty >4000


23 )Write a query that returns a list of orders where the standard_qty is zero and
 either the gloss_qty or poster_qty is over 1000.
SELECT * 
FROM orders 
WHERE standard_qty=0 AND (gloss_qty>1000 OR poster_qty >1000)

24) Find all the company names that start with a 'C' or 'W', and the primary
 contact contains 'ana' or 'Ana', but it doesnt contain 'eana'.

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
AND primary_poc NOT LIKE '%eana%');




