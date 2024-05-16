/*  For each gender - male and female - find the absolute and percentage profit (like in Q16) by product name. */
SELECT 
    c.gender,
    p.category,
    SUM(o.total_amount_paid) - SUM(p.procurement_cost_per_unit * o.tot_units) AS absolute_profit,
    100.0 * SUM(o.total_amount_paid)/SUM(p.procurement_cost_per_unit * o.tot_units) - 1 AS percentage_profit
FROM customers AS c
LEFT JOIN orders AS o
    ON c.cust_id = o.cust_id
LEFT JOIN products AS p
    ON p.MyUnknownColumn = o.product_id
GROUP BY  c.gender, p.category;