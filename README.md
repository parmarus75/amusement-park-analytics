# Amusement Park Data Pipeline

End-to-end data engineering project using:
- Airflow for orchestration
- PySpark for transformation
- Snowflake for data warehouse
- AWS S3 for staging

## Setup
1. Create venv: `python3.11 -m venv venv`
2. Activate: `source venv/bin/activate`
3. Install packages (see requirements)
4. Setup PostgreSQL database
5. Start Airflow: `airflow webserver`

## Project Structure
- airflow/dags: DAG definitions
- scripts: PySpark jobs and utilities
- config: Configuration files
- data: Local data for testing
