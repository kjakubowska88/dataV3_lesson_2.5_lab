show databases;
use sakila;
show tables;

-- 1 Select all the actors with the first name ‘Scarlett’.
select * from actor
where first_name = 'Scarlett';

-- 2 How many films (movies) are available for rent and how many films have been rented?
select * from rental limit 4;
select count(distinct(title)) from film;
select * from inventory limit 5;

select count(distinct(inventory_id)) As For_rent from inventory;
select count(distinct(inventory_id)) as movies_rented_per_Id from rental;
select count(rental_id) as not_returned_yet from rental where return_date IS NULL;
select count(rental_id) as total_rented from rental where rental_date is not null;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration, min(length) as min_duration
from film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length) / 60 ) as hours, round(avg(length) % 60) as minutes
from film;

-- 5 How many distinct (different) actors' last names are there?
select count(distinct last_name) as Actors
from actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?

select min(rental_date) as Min_date, max(rental_date) as last_rental from rental;
select DATEDIFF('2006-02-14 15:16:03', '2005-05-24 22:53:30') As Days_Opened;


-- 7 Show rental info with additional columns month and weekday. Get 20 results.
select *, year(rental_date) as Year, month(rental_date) as month, dayname(rental_date) from rental limit 20;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.


-- 9 How many rentals were in the last month of activity?
select date(max(rental_date))  -INTERVAL 30 DAY as max, date(max(rental_date)) as min
from rental;
select count(rental_id) as Last_month_rental from rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14"); 
