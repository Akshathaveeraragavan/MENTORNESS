/*  Generally the more numbers of units you buy, the more discount seller will give you. For 'Dell AX420' is there a relationship between number of units ordered and average discount from selling price? Take only 'buy' order types */
SELECT
    o.tot_units,
    COUNT(o.order_id) AS total_orders,
    AVG(100.0 - (100.0 * o.total_amount_paid / (o.displayed_selling_price_per_unit * o.tot_units))) AS average_discount_from_sp
FROM orders AS o
JOIN products AS p ON p.MyUnknownColumn = o.product_id WHERE o.order_type = 'buy' AND p.product_name = 'Dell AX420'
GROUP BY o.tot_units ORDER BY o.tot_units;
