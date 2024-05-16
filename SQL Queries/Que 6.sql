/* For each delivery_person_id, print the count of orders and total amount paid for
product_id = 12350 or 12348 and total units > 8. Sort the output by total amount paid in
descending order. Take only 'buy' order types */
select delivery_person_id, count(distinct(order_id)) as count_of_orders , sum(total_amount_paid) from orders
where product_id=12350 or product_id=12348 and tot_units>8 and order_type='buy'
group by delivery_person_id;