/* Print the Full names (first name plus last name) for customers that have email on "gmail.com"? */
select concat( first_name , ' ' , last_name) as full_name from customers
where email like '%gmail.com';
