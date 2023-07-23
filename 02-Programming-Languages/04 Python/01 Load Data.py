
# %%
import psycopg2
from sqlalchemy import create_engine

import pandas as pd


# %%
con = psycopg2.connect(
    host='localhost', port= '5432',
    database="thro_db",
    user='thro_stud', password='thro_pw'    
)

engine = create_engine('postgresql://thro_stud:thro_pw@localhost:5432/thro_db')

# %%
cur = con.cursor()

cur.execute("SELECT * FROM plant")

records = cur.fetchall()

con.close()

records_df = pd.read_sql_query('SELECT * FROM plant', con=engine)

# %%
records
records_df


# %%
