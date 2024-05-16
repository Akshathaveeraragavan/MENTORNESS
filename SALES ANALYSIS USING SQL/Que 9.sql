/* Create following columns from order_dim data - order_date , Order day , Order month , Order year */
SELECT
    order_date,
    EXTRACT(DAY FROM order_date) AS order_day,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM orders;