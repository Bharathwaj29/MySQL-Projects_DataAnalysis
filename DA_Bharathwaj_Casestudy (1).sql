use sakila;
-- Task1
select * from actor;

-- Task2
select concat(first_name, ' ', last_name) AS Fullname from actor;
select first_name, count(first_name) as repated_fname from actor group by first_name having repated_fname>1;
select last_name, count(last_name) as repated_lname from actor group by last_name having repated_lname>1;

-- Task3
select rating, count(*) as Count_movies from film group by rating;

-- Task4
select rating, avg(rental_rate) AS Rental_rate from film group by rating;

-- Task5
select title, replacement_cost from film where replacement_cost<9;
select title, replacement_cost from film where replacement_cost between 15 and 20;
select title, replacement_cost, rental_rate from film  
order by rental_rate asc, replacement_cost desc;

-- Task6
 SELECT f.title, COUNT(fi.actor_id) AS actor_count
 FROM 
 film f
 JOIN film_actor AS fi ON (f.film_id=fi.film_id)
 GROUP BY f.title;
 
-- Task 7
SELECT title
 FROM film
 WHERE (title LIKE '%Q%' OR title LIKE '%K%');
 
 -- Task8
 select a.first_name, a.last_name , f.title from actor as a
 join film_actor as fi
 join film as f
 on a.actor_id = fi.actor_id and fi.film_id = f.film_id
 where f.title = 'AGENT TRUMAN';
 
-- Task9
select f.title, ca.name
from film f
join film_category as fi
join category as ca
on f.film_id=fi.film_id and fi.category_id=ca.category_id
where ca.name = 'children'
group by  f.title, ca.name;

-- Task10
select f.title, count(f.title) as rentals from film  f
join inventory as i
join rental as r
on f.film_id = i.film_id and i.inventory_id = r.inventory_id
group by f.title order by rentals desc;

-- Task11
select ca.category_id, avg(f.replacement_cost - f.rental_rate) as diff 
from category as ca
join film_category as fi
join film as f
on ca.category_id = fi.category_id and fi.film_id = f.film_id
group by ca.category_id
having diff>15;

-- Task12
select ca.name, count(fi.film_id) as Total_movies
from film_category fi
join category as ca
on fi.category_id=ca.category_id
group by  ca.name
order by Total_movies between 60 and 70;


  










