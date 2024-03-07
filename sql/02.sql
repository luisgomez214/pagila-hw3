/*
 * Compute the country with the most customers in it. 
 */

select country.country as "country"
from customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
group by country.country 
order by count(*) desc 
limit 1;
