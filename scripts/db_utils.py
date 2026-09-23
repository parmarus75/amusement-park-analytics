import psycopg2
from psycopg2.extras import RealDictCursor
import os
from dotenv import load_dotenv

load_dotenv()

class PostgresConnection:
    def __init__(self):
        self.host = os.getenv('DB_HOST', 'localhost')
        self.database = os.getenv('DB_NAME', 'orlando_parks')
        self.user = os.getenv('DB_USER', 'orlando_user')
        self.password = os.getenv('DB_PASSWORD', 'orlando_password123')
        self.port = os.getenv('DB_PORT', '5432')
    
    def get_connection(self):
        return psycopg2.connect(
            host=self.host,
            database=self.database,
            user=self.user,
            password=self.password,
            port=self.port
        )
    
    def execute_query(self, query):
        conn = self.get_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        conn.close()
        return results
    
    def fetch_all_tables(self):
        query = """
        SELECT table_name FROM information_schema.tables 
        WHERE table_schema = 'public'
        """
        return self.execute_query(query)

if __name__ == "__main__":
    db = PostgresConnection()
    tables = db.fetch_all_tables()
    print("Tables in orlando_parks database:")
    for table in tables:
        print(f"  - {table['table_name']}")
