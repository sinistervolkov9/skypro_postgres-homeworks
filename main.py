# hw-1

# Написать скрипт в main.py,
# который заполнит созданные таблицы данными из north_data

# Скрипт для заполнения данными таблиц в БД Postgres:

import psycopg2
import csv
from settings import DATA_PATH_CUSTOMERS, DATA_PATH_EMPLOYERS, DATA_PATH_ORDERS

# Открыть файл с данными
# Считать данные
# Открыть бд
# Записать туда считанные данные

# Подключение к базе данных
with psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="7943"
) as connection:

    # create cursor
    # С ПОМОЩЬЮ ЭТОГО КУРСОРА ДЕЛАЕМ РАЗЛИЧНЫЕ SQL-КОМАНДЫ
    with connection.cursor() as cursor:

        # Открытие csv-файла customers
        with open(DATA_PATH_CUSTOMERS, 'r', encoding="utf-8") as file:
            reader = csv.reader(file)
            next(reader)
            for row in reader:
                # print(row)
                # Запись из csv-файла в БД:
                cursor.execute("INSERT INTO customers VALUES (%s, %s, %s)", (
                    row[0], row[1], row[2]))

        # Открытие csv-файла employers
        with open(DATA_PATH_EMPLOYERS, 'r', encoding="utf-8") as file:
            reader = csv.reader(file)
            next(reader)
            for row in reader:
                # print(row)
                # Запись из csv-файла в БД:
                cursor.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", (
                    row[0], row[1], row[2], row[3], row[4], row[5]))

        # Открытие csv-файла orders
        with open(DATA_PATH_ORDERS, 'r', encoding="utf-8") as file:
            reader = csv.reader(file)
            next(reader)
            for row in reader:
                # print(row)
                # Запись из csv-файла в БД:
                cursor.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", (
                    row[0], row[1], row[2], row[3], row[4]))

connection.close()
