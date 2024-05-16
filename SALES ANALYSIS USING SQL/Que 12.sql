/* How many distinct customers and delivery boys are there in each state? */
select count(distinct(cust_id)) , count(gender) from customers 
join pincode on pincode.pincode=customers.primary_pincode
where gender='male'
group by pincode.state;