/* How many units have been sold by each brand? Also get total returned units for each brand. */
SELECT
    p.brand AS brand,
    SUM(o.tot_units) AS total_units_sold,
    SUM(CASE WHEN o.return_rate > 0 THEN o.tot_units ELSE 0 END) AS total_returned_units
FROM orders o
JOIN products p ON o.product_id = p.MyUnknownColumn
GROUP BY p.brand;

