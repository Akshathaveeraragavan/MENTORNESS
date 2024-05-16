/* How many customers are there in each pincode and gender combination? */
SELECT primary_pincode, count(cust_id) as num_customers, GENDER  FROM customers
group by primary_pincode, gender;