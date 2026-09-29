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
    df = hook.get_pandas_df(f"SELECT * FROM {table_name}")
    output_path = f"/opt/airflow/dags/data/{table_name}.csv"
    df.to_csv(output_path, index=False)
    print(f"Saved {len(df)} rows from '{table_name}' to {output_path}")

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
