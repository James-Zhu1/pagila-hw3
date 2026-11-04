/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */


SELECT name, title, "total rentals"
FROM category
JOIN LATERAL (
    SELECT title, count(*) AS "total rentals"
    FROM film_category
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    WHERE film_category.category_id = category.category_id
    GROUP BY film_id, title
    ORDER BY "total rentals" DESC, film_id DESC
    LIMIT 5
) best ON true
ORDER BY name, "total rentals" DESC, title;
