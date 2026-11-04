/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */

SELECT f.title
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN film_actor src ON src.actor_id = fa.actor_id
JOIN film sf ON sf.film_id = src.film_id
WHERE sf.title IN ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
GROUP BY f.film_id, f.title
HAVING count(*) >= 3
ORDER BY f.title;
