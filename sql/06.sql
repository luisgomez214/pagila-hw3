/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */


SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_actor AS russell_film_actor ON film.film_id = russell_film_actor.film_id
JOIN actor AS russell_actor ON russell_film_actor.actor_id = russell_actor.actor_id
WHERE russell_actor.first_name = 'RUSSELL' AND russell_actor.last_name = 'BACALL'
AND NOT (actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL')
ORDER BY "Actor Name";

