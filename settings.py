import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()
PASSWORD = os.getenv("My_PostgreSQL_password")

ROOT_PATH = Path(__file__).parent
DATA_PATH_CUSTOMERS = ROOT_PATH.joinpath("homework-1", "north_data", "customers_data.csv")
DATA_PATH_EMPLOYERS = ROOT_PATH.joinpath("homework-1", "north_data", "employees_data.csv")
DATA_PATH_ORDERS = ROOT_PATH.joinpath("homework-1", "north_data", "orders_data.csv")
