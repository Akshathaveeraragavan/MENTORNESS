/* How many total orders were there in each month and how many of them were returned? Add a column for return rate too.
return rate = (100.0 * total return orders) / total buy orders*/
SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_type = 'return' THEN 1 ELSE 0 END) AS total_returned_orders,
    ROUND((100.0 * SUM(CASE WHEN order_type = 'return' THEN 1 ELSE 0 END)) / COUNT(*), 2) AS return_rate
FROM orders
GROUP BY
    EXTRACT(MONTH FROM order_date);
