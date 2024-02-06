-- Подключиться к БД Northwind и сделать следующие изменения:

-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)

alter table products
add constraint
chk_unit_price check (unit_price > 0);

-- 2. Добавить ограничение, что поле discontinued таблицы products
-- может содержать только значения 0 или 1

alter table products
add constraint
chk_discontinued check (discontinued = 0 or discontinued = 1);

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)

create table discontinued_sales_products as
select * from products
where discontinued = 1;
select * from discontinued_sales_products;

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key.
-- Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.

create table discontinued_products as
select * from products where discontinued = 1;
delete from products
where discontinued = 1 and product_id not in
(select product_id from order_details);
delete from order_details
where product_id not in
(select product_id from products);
