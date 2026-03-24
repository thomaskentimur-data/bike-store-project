-- checking every table
select *
from brands;
select *
from categories;
select *
from customers;
select *
from order_items; 
select *
from orders;
select *
from products;
select *
from staffs;
select *
from stocks;
select *
from stores;

-- change data in customers table
select *
from customers;
select concat(`first_name`,' ', `last_name`)as nama, phone
from customers; -- combine 2 columns
alter table customers
add column nama varchar(255); -- adding new column
set sql_safe_updates = 0; -- if cant update table
update customers
set nama = concat(`first_name`,' ', `last_name`); -- fill value nama column from first_name and last_name
alter table customers
drop first_name; -- deleting column
alter table customers
drop last_name; -- deleting column
alter table customers
modify column nama varchar(255)
after customer_id; -- modify position column

-- changing data in staffs table
alter table staffs
add column staff varchar(255);
update staffs
set nama_staff = concat(`first_name`, ' ', `last_name`);
alter table staffs
modify column nama varchar(255)
after staff_id;
alter table staffs
drop first_name;
alter table staffs
drop last_name;
alter table staffs
change nama staff_name varchar(255);

select pro.product_id, pro.product_name,bra.brand_name, cat.category_name, pro.model_year, pro.list_price
from products as pro
inner join brands as bra
on bra.brand_id = pro.brand_id
inner join categories as cat
on cat.category_id = pro.category_id;

create table prod(
product_id int,
product_name varchar(255),
brand_name varchar(255),
category_name varchar(255),
model_year int,
list_price decimal(10,2)
);

insert into prod
select pro.product_id, pro.product_name,bra.brand_name, cat.category_name, pro.model_year, pro.list_price
from products as pro
inner join brands as bra
on bra.brand_id = pro.brand_id
inner join categories as cat
on cat.category_id = pro.category_id;

select *
from prod;

select cus.nama, ord.order_date, ord.required_date, ord.shipped_date, str.store_name, stf.staff_name, pro.product_name, pro.model_year, pro.category_name, pro.brand_name, items.quantity, items.list_price, items.discount, round(((items.quantity*items.list_price)-((items.quantity*items.list_price)*items.discount)),2) as total
from order_items as items
inner join orders as ord
on items.order_id = ord.order_id
inner join customers as cus
on ord.customer_id = cus.customer_id
inner join stores as str
on ord.store_id = str.store_id
inner join staffs as stf
on ord.staff_id = stf.staff_id
inner join prod as pro
on items.product_id = pro.product_id;

create table trans(
nama varchar(255),
oder_date date, 
required_date date, 
shipped_date date, 
store_name varchar(255), 
staff_name varchar(255), 
product_name varchar(255), 
model_year int, 
category_name varchar(255), 
brand_name varchar(255),
quantity int, 
list_price decimal(10,2), 
discount decimal (10,2), 
total decimal(10,2)
);

insert into trans
select cus.nama, ord.order_date, ord.required_date, ord.shipped_date, str.store_name, stf.staff_name, pro.product_name, pro.model_year, pro.category_name, pro.brand_name, items.quantity, items.list_price, items.discount, round(((items.quantity*items.list_price)-((items.quantity*items.list_price)*items.discount)),2) as total
from order_items as items
inner join orders as ord
on items.order_id = ord.order_id
inner join customers as cus
on ord.customer_id = cus.customer_id
inner join stores as str
on ord.store_id = str.store_id
inner join staffs as stf
on ord.staff_id = stf.staff_id
inner join prod as pro
on items.product_id = pro.product_id;

select * from trans;

select *,
row_number() over(partition by nama,oder_date, required_date, shipped_date, store_name, staff_name, product_name, model_year, category_name, brand_name,quantity, list_price, discount, total) as row_num
from trans;

with duplicate_cte as(
select *,
row_number() over(partition by nama,oder_date, required_date, shipped_date, store_name, staff_name, product_name, model_year, category_name, brand_name,quantity, list_price, discount, total) as row_num
from trans)
select * from duplicate_cte
where row_num >1;

select * from trans;

select count(*)
from trans;

select count(*)
from trans
where shipped_date is null;

delete from trans
where shipped_date is null;

select * from trans
where quantity <= 0
or list_price <= 0;

-- EDA

-- best customers by total_revenue
select nama, sum(total) as total_revenue
from trans
group by nama
order by total_revenue desc
limit 5;
-- best customer by total_order
select nama, sum(quantity) as total_order
from trans
group by nama
order by total_order desc
limit 5;

alter table trans
change oder_date order_date date;

-- shipping time
select order_date, shipped_date, datediff(shipped_date,order_date) as shipping_time
from trans;
-- avg shipping time
select avg(datediff(shipped_date,order_date)) as avg_shipping_time
from trans;
-- longest shipping time
select order_date, shipped_date, datediff(shipped_date,order_date) as shipping_time
from trans
order by shipping_time desc;

-- sales trend
select date_format(order_date, '%Y-%m') as `year_month`, sum(total) as total
from trans
group by `year_month`
order by `year_month`;

-- revenue by store --
select store_name, sum(total) as total
from trans
group by store_name
order by total desc;

-- revenue by staff or staff performance
select staff_name, sum(total) as total
from trans
group by staff_name
order by total desc;

-- top 5 sold product
select product_name, sum(quantity) as total
from trans
group by product_name
order by total desc
limit 5;

-- top 5 revenue by product

select product_name, sum(total) as total
from trans
group by product_name
order by total desc
limit 5;

-- top category revenue
select category_name, sum(total) as total
from trans
group by category_name
order by total desc;

-- top brand revenue
select brand_name, sum(total) as total
from trans
group by brand_name
order by total desc;


select * from trans;