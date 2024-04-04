from airflow import DAG
from datetime import datetime, timedelta
from airflow.contrib.operators.kubernetes_pod_operator import KubernetesPodOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator

def print_hello():
    print("Hello world")

with DAG (
    dag_id="raw_to_qualified",
    start_date=datetime(2021, 1, 1),
    schedule_interval="@daily",
) as dag:
    
    task1 = PythonOperator(
        task_id="task1",
        python_callable=print_hello
    )

