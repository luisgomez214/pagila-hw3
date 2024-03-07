/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */


select title --, customer_id
from (
select distinct f1.title, c1.customer_id --, count(title) --, c1.customer_id
from film f1
join inventory i1 on f1.film_id = i1.film_id
join rental r1 on i1.inventory_id = r1.inventory_id
join customer c1 on r1.customer_id = c1.customer_id
where c1.customer_id in (
select c1.customer_id
from film f1
join inventory i1 on f1.film_id = i1.film_id
join rental r1 on i1.inventory_id = r1.inventory_id
join customer c1 on r1.customer_id = c1.customer_id
where f1.title = 'BUCKET BROTHERHOOD'
)
) as t
group by title
having count(title) >=3
except
select title
from film
where film.title = 'BUCKET BROTHERHOOD'
order by title;
