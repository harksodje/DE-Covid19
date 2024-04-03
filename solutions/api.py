
from google.cloud import storage
from dotenv import load_dotenv
import os
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
from pyarrow import fs

load_dotenv() 
gcs = fs.GcsFileSystem()
storage_client = storage.Client()

bucket_name = os.environ.get('BUCKET_NAME')



files = [
    file.name for file in storage_client.list_blobs(bucket_name)
]

file_path_gcs = f"gs://{bucket_name}/us_counties_covid19_daily.csv"

df = pd.read_csv(file_path_gcs)

def upload_file(source_path, destination_path):
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_path)
    blob.upload_from_filename(source_path)
    
print(df.info())
print("size of the data :", len(df))

table = pa.Table.from_pandas(df)

print("table created in parquet format")

# pq.write_table(table, 'us_counties_covid19_daily.parquet')

qualified_path  = f"{bucket_name}/qualified/us_counties_covid19_daily.parquet"
pq.write_to_dataset(table, root_path=qualified_path, partition_cols=['date']  , filesystem=gcs, existing_data_behavior='overwrite_or_ignore')
# upload_file(table, qualified_path)