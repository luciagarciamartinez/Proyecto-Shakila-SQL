-- Ejercicio 2--

select "title"
from film f 
where "rating"= 'R';

-- Ejercicios 3--

select "first_name"
from "actor"
where "actor_id" between 30 and 40;

-- Ejercicios 4--

select "title"
from "film"
where "language_id" = "original_language_id";

-- Ejercicio 5--

select "title", "length"
from "film"
order by "length" asc ;

-- Ejercicio 6--

select "first_name", "last_name"
from "actor"
where "last_name"= 'ALLEN';

-- Ejercicio 7--

select count("title"), "rating"
from film f 
group by "rating";

-- Ejercicio 8--

select "title"
from "film"
where "rating"= 'PG-13' or "length" > 180;

-- Ejercicio 9--

select variance("replacement_cost")
from "film";

-- Ejercicio 10--
select MAX("length")as "maxima_duracion", MIN("length") as "minima_duracion"
from "film";

-- Ejercicio 11--

select "payment_date", "amount"
from "payment"
order by "payment_date" desc 
limit 1 offset 2;

-- Ejercicio 12 --

select "title", "rating"
from "film"
where "rating"<>'G' and "rating" <> 'NC-17'

-- Ejercicio 13 --

select round(avg("length"),2) as "promedio_duracion", "rating"
from film f 
group by "rating";

-- Ejercicio 14 --

select "title"
from "film"
where "length">180;

-- Ejercicio 15 --

select SUM("amount") as "ingresos_totales"
from "payment";

-- Ejercicio 16 --

select "first_name", customer_id 
from "customer"
order by customer_id desc
limit 10;

-- Ejercicio 17 --

select a."first_name", a."last_name"
from "actor" as a 
inner join film_actor fa on a.actor_id = fa.actor_id
inner join film f on fa.film_id = f.film_id
where f."title"= 'EGG IGBY';

-- Ejercicio 18 --

select distinct "title"
from  "film";

-- Ejercicio 19 --

select f."title"
from film f 
inner join film_category fc on f.film_id= fc.film_id
inner join category c on c.category_id= fc.category_id 
where c.name= 'Comedy' and f.length > 180;

-- Ejercicio 20 --

select c."name", Round(AVG(F.length ),2)
from "category" as c
inner join film_category fc on c.category_id = fc.category_id 
inner join film f on fc.film_id = f.film_id
group by "name" 
having AVG(f.length )> 110;

-- Ejercicio 21 --

select ROUND(AVG(rental_duration),2)
from film f ;

-- Ejercicio 22 --

select concat("first_name",' ',"last_name") as "nombre_completo"
from actor a 

-- Ejercicio 23 --

select date("rental_date") as dia, count(r.rental_date ) as numero_alquileres
from rental r 
group by dia 
order by numero_alquileres  desc;

-- Ejercicio 24 --

select "title", "length"
from film f 
where "length">(select round(avg(f.length ),2) from film f);

-- Ejercicio 25 --

select TO_CHAR("rental_date", 'MM-YYYY') as mes, count(r.rental_date ) as numero_alquileres
from rental r 
group by mes; 

-- Ejercicio 26 --

select avg("amount") as promedio_pago, stddev("amount") as desviacion_estandar_pago, variance("amount") as varianza_pago
from payment p;

-- Ejercicio 27 --

select "rental_rate", "title"
from film f 
where "rental_rate">(select round(avg(f.rental_rate  ),2) from film f);

-- Ejercicio 28 --

select "actor_id", COUNT("film_id")
from film_actor fa 
group by actor_id 
having COUNT("film_id") > 40;

-- Ejercicio 29 --

select f."title", COUNT("store_id") as inventario_disponible
from inventory i 
left join film f on f.film_id = i.film_id
group by f.title;

-- Ejercicio 30 --

select a."actor_id", concat(a."first_name",' ',a."last_name") as nombre_completo, COUNT("film_id")
from film_actor fa 
inner join actor a on a.actor_id = fa.actor_id 
group by a."actor_id";

-- Ejercicio 31 --

select f."title", a."first_name", a.last_name 
from film f 
left join film_actor fa on f.film_id = fa.film_id
left join actor a on fa.actor_id = a.actor_id;

-- Ejercicio 32 --

select a."first_name", a.last_name, f."title"
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id
left join film f  on fa.film_id = f.film_id ;

-- Ejercicio 33 --

select f."title", count(r."rental_id") as numero_alquileres
from film f 
full join inventory i on f.film_id = i.film_id
full join rental r on i.inventory_id = r.inventory_id
group by f."title"
order by numero_alquileres desc;

-- Ejercicio 34 --

select c."first_name", c."last_name", SUM (p."amount") as total_gastado
from customer c 
inner join payment p on c.customer_id = p.customer_id
group by c."first_name", c."last_name"
order by total_gastado desc
limit 5;

-- Ejercicio 35 --

select "first_name", "last_name"
from actor a 
where "first_name"= 'JOHNNY';

-- Ejercicoo 36 --

select "first_name" as "nombre", "last_name" as "apellido"
from actor a ;

-- Ejercicio 37 --

select MAX("actor_id") as id_masalto, MIN("actor_id")as id_masbajo
from actor a;

-- Ejercicio 38 --

select COUNT ("actor_id") as total_actores
from actor a;

-- Ejercicio 39 --

select "first_name" as "nombre", "last_name" as "apellido"
from actor a
order by "apellido" asc;

-- Ejercicio 40 --

select "title"
from film f 
limit 5;

-- Ejercicio 41 --

select count("first_name"), "first_name"
from actor a 
group by "first_name"
order by count("first_name") desc;

-- Ejercicio 42 --

select r."rental_id", c."first_name"
from rental r 
inner join customer c on r.customer_id = c.customer_id;

-- Ejercicio 43 --

select r."rental_id", c."first_name"
from rental r 
right join customer c on r.customer_id = c.customer_id;

-- Ejercicio 44 --

select *
from film f 
cross join category c ;

-- No aporta valor, porque como las tablas no están relacionadas directamente, lo que hace el CROSS JOIN es mezclar cada película con todas las categorías--

-- Ejercicio 45 --

select a."first_name", "last_name"
from actor a 
inner join film_actor fa on a.actor_id = fa.actor_id
inner join film f on fa.film_id = f.film_id
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c."name" ='Action';

-- Ejercicio 46 --

select "first_name","last_name"
from actor a 
where actor_id not in (select "actor_id" from "film_actor");

-- Ejercicio 47 --

select a."first_name", a."last_name", count(fa.film_id ) as numero_peliculas
from actor a 
inner join film_actor fa on a.actor_id = fa.actor_id 
group by a."first_name", a."last_name";

-- Ejercicio 48 --

create view  actor_num_peliculas as
select a."first_name", a."last_name", count(fa.film_id ) as numero_peliculas
from actor a 
inner join film_actor fa on a.actor_id = fa.actor_id 
group by a."first_name", a."last_name";

-- Ejercicio 49 --

select COUNT(r."rental_id") as "total_alquileres", c."first_name", c."last_name" 
from rental r 
right join customer c on r.customer_id = c.customer_id
group by  c."first_name", c."last_name"
order by "total_alquileres" desc;

-- Ejercicio 50 --

select SUM(f."length")as "duaracion_total", c."name"
from film f 
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
group by c."name"
having c."name" = 'Action';

-- Ejercicio 51 --

create temp table cliente_rentas_temporal as
select COUNT(r."rental_id") as "num_alquileres", c."first_name",  c."last_name"
from customer c 
left join rental r on c.customer_id = r.customer_id
group by c."first_name", c."last_name";

-- Ejercicio 52 --

create temp table peliculas_alquiladas as
select f."title", COUNT(r."rental_id") as "total_alquileres"
from rental r 
inner join inventory i on r.inventory_id = i.inventory_id
inner join film f on i.film_id = f.film_id
group by f."title"
having COUNT("rental_id") >= 10;

-- EJERCICIO 53 --

select "title"
from film f 
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
where r."return_date" is null and r."customer_id"= (select "customer_id" from customer c where 
c."first_name"='TAMMY' and c."last_name"='SANDERS')
order by "title" asc;

-- EJERCICIO 54 --

select "first_name", "last_name"
from actor a 
where "actor_id" in (SELECT "actor_id" 
    FROM "film_actor" 
    WHERE "film_id" in (SELECT "film_id" 
        FROM "film_category" 
        WHERE "category_id" = (SELECT "category_id" FROM "category" WHERE "name" = 'Sci-Fi')))
 order by "last_name" asc;

-- EJERCICIO 55 --

select distinct a."first_name", a."last_name"
from actor a
inner join film_actor fa on a.actor_id = fa.actor_id
inner join  inventory i on fa.film_id = i.film_id
inner join  rental r on i.inventory_id = r.inventory_id
where r.rental_date > (
    select MIN(r2."rental_date")
    from rental r2
    inner join  inventory i2 on r2.inventory_id = i2.inventory_id
    inner join film f2 on i2.film_id = f2.film_id
    where f2.title = 'SPARTACUS CHEAPER'
)
order by a.last_name asc; 

-- Ejercicio 56 --

select "first_name", "last_name"
from actor a 
where "actor_id" not in (SELECT "actor_id" 
    FROM "film_actor" 
    WHERE "film_id" in (SELECT "film_id" 
        FROM "film_category" 
        WHERE "category_id" = (SELECT "category_id" FROM "category" WHERE "name" = 'Sci-Fi')))
 order by "last_name" asc;

-- Ejercicio 57 --

select f."title", count(r."rental_date")
from film f 
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id 
group by f."title"
having count(r."rental_date")> 8;

-- Ejercicio 58 --

select f."title", c."name" 
from film f 
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c."name" = 'Animation';

-- Ejercicio 59 --

select "title", "length"
from film f 
where "length" = (select "length" from "film" where "title"= 'DANCING FEVER' )
order by "title" asc;

-- Ejercicio 60 --

select c."first_name", c."last_name", COUNT(distinct r."rental_id") as "num_alquileres"
from customer c 
inner join rental r on c.customer_id = r.customer_id
group by c."first_name", c."last_name"
having COUNT(distinct r."rental_id")>=7;

-- Ejercicio 61 --

select COUNT(r."rental_id") as "recuento_alquileres", c."name"
from category c 
inner join film_category fc on c.category_id = fc.category_id 
inner join inventory i on fc.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id 
group by c."name";

-- Ejercicio 62 --

select count(f."film_id"), c."name", f."release_year"
from film f 
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
group by c."name" , f."release_year"
having f."release_year"= 2006;

-- Ejercicio 63 --

select s."first_name", s."last_name", st."store_id"
from staff s 
cross join store st;

-- Ejercicio 64 --

select COUNT (r."rental_id") as "cantidad_alquileres", c."customer_id", c."first_name", c."last_name"
from customer c 
left join rental r on c.customer_id = r.customer_id
group by c."customer_id", c."first_name", c."last_name";


