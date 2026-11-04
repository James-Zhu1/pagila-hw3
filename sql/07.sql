/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


WITH bacall0 AS (
    SELECT actor_id
    FROM actor
    WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
),
bacall1 AS (
    SELECT DISTINCT fa2.actor_id
    FROM bacall0
    JOIN film_actor fa1 USING (actor_id)
    JOIN film_actor fa2 ON fa2.film_id = fa1.film_id
),
bacall2 AS (
    SELECT DISTINCT fa2.actor_id
    FROM bacall1
    JOIN film_actor fa1 USING (actor_id)
    JOIN film_actor fa2 ON fa2.film_id = fa1.film_id
    EXCEPT
    SELECT actor_id FROM bacall1
    EXCEPT
    SELECT actor_id FROM bacall0
)
SELECT first_name || ' ' || last_name AS "Actor Name"
FROM bacall2
JOIN actor USING (actor_id)
ORDER BY "Actor Name";
