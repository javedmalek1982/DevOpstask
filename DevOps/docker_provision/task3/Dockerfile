# Use the official Python image
FROM python:3

# Install the required dependencies
RUN pip install boto3 \
    && pip install awscli 

# Set the working directory
WORKDIR /app

# Copy the contents of the current directory into the container
COPY . .

# Set the environment variable for the AWS credentials file
ENV AWS_SHARED_CREDENTIALS_FILE=/app/.aws/credentials

# Run the AWS CLI script
CMD ["python3", "aws-cli.py", "--region", "ap-south-1"]