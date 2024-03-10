import boto3

def create_bucket(bucket_prefix, s3_connection):
    session = boto3.session.Session()
    current_region = session.region_name
    bucket_name = bucket_prefix
    bucket_response = s3_connection.create_bucket(
        Bucket=bucket_name,
        CreateBucketConfiguration={
            'LocationConstraint': current_region
        }
    )
    return bucket_name, bucket_response

def upload_file(bucket_name, file_name,s3_connection):
    try:
        response=s3_connection.put_object(Bucket=bucket_name, Key=file_name)
        print(f"{file_name} uploaded successfully")
    except Exception as e:
        print(f"fialed to upload {file_name}")

s3 = boto3.client('s3')
bucket_name="tf-backend-s3-0099"
create_bucket(bucket_name, s3)
upload_file(bucket_name,"dev/terraform.tfstate",s3)

