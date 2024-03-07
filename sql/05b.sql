/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */


SELECT DISTINCT f.title
FROM film_actor AS fa1
JOIN film_actor AS fa2 ON fa1.actor_id = fa2.actor_id
JOIN film AS f ON fa2.film_id = f.film_id
JOIN (
    SELECT film_id
    FROM film_actor
    WHERE actor_id IN (
        SELECT actor_id
        FROM film
        JOIN film_actor USING (film_id)
        WHERE film.title = 'AMERICAN CIRCUS'
    )
    GROUP BY film_id
    HAVING COUNT(*) >= 2
) AS shared_movies ON f.film_id = shared_movies.film_id
order by f.title; 

