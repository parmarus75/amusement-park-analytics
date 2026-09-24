from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.operators.python import PythonOperator

default_args = {
    'owner': 'data-eng',
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

def extract_table(table_name, **context):
    hook = PostgresHook(postgres_conn_id='orlando_postgres')
    records = hook.get_records(f"SELECT COUNT(*) FROM {table_name}")
    row_count = records[0][0]
    print(f"Table '{table_name}' has {row_count} rows")
    return row_count

with DAG(
    dag_id='extract_park_data',
    default_args=default_args,
    description='Extract data from orlando_parks PostgreSQL database',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=['orlando-parks', 'extraction'],
) as dag:

    tables = ['parks', 'rides', 'attractions', 'wait_times', 'tickets', 'visitor_statistics']

    for table in tables:
        PythonOperator(
            task_id=f'extract_{table}',
            python_callable=extract_table,
            op_kwargs={'table_name': table},
        )
