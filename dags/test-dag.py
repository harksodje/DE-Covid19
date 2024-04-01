from datetime import datetime, timedelta
from airflow import DAG

with DAG('test-dag', start_date=datetime(2020, 1, 1), schedule_interval=timedelta(days=1)) as dag:
    pass