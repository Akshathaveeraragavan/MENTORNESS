/* How many delivery personal are there in each pincode? */
SELECT  PINCODE , COUNT(delivery_person_id) FROM delivery_person
GROUP BY pincode;