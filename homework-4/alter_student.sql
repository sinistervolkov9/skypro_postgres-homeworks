-- 1. Создать таблицу student с полями:
-- student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

create table student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar

alter table student add column
middle_name varchar;

-- 3. Удалить колонку middle_name

alter table student drop column
middle_name;

-- 4. Переименовать колонку birthday в birth_date

alter table student rename column
birthday to birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)

alter table student
alter column phone
set data type varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора

insert into student (student_id, first_name, last_name, birthday, phone)
values
(default, 'Petr', 'Petrov', '1984-01-01', '8(987)654-32-10'),
(default, 'Ivan', 'Ivanov', '1980-05-02', '8(900)789-45-48'),
(default, 'Roman', 'Romanov', '1986-12-13', '8(951)123-96-78');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние

truncate table student restart identity;

select * from student;
