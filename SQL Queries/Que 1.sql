/* How many customers do not have DOB information available? */
select count(*) as NO_DOB_INFO from customers where dob='';