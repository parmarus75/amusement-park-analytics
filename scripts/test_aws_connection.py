import boto3
import os
from dotenv import load_dotenv

load_dotenv()

s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
    region_name=os.getenv('AWS_REGION')
)

bucket_name = os.getenv('AWS_S3_BUCKET')

response = s3.list_buckets()
print("Buckets in your AWS account:")
for bucket in response['Buckets']:
    print(f"  - {bucket['Name']}")

print(f"\nChecking if our bucket '{bucket_name}' exists...")
if bucket_name in [b['Name'] for b in response['Buckets']]:
    print("SUCCESS: Found our bucket!")
else:
    print("Bucket not found - check the name in .env")
