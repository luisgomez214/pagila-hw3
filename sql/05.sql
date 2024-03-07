/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT film.title
FROM film
JOIN film_actor AS fa1 ON film.film_id = fa1.film_id
JOIN film_actor AS fa2 ON fa1.actor_id = fa2.actor_id
JOIN film AS american_circus ON american_circus.film_id = fa2.film_id
WHERE american_circus.title = 'AMERICAN CIRCUS'
order by film.title;

