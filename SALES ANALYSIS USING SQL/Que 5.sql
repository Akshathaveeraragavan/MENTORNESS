/* For each Pin code, print the count of orders, sum of total amount paid, average amount paid, maximum amount paid, minimum amount paid for
 the transactions which were paid by 'cash'. Take only 'buy' order types */
SELECT delivery_pincode , COUNT(ORDER_ID) as count_of_orders , SUM(TOTAL_AMOUNT_PAID) as sum_total_paid , 
AVG(TOTAL_AMOUNT_PAID) as avg_total_paid ,
 MIN(TOTAL_AMOUNT_PAID) as min_total_paid , PAYMENT_TYPE , order_type FROM ORDERS
WHERE payment_type='cash' and order_type='Buy'
group by delIVERY_PINCODE;