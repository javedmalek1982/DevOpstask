import argparse
import boto3

# Define the client for EC2
ec2 = boto3.client('ec2')

# Define the command line argument for the region
parser = argparse.ArgumentParser(description='List EC2 instances in a given region.')
parser.add_argument('--region', dest='region', required=True, help='The AWS region to list instances from.')
args = parser.parse_args()

# Define the session using the desired region
session = boto3.Session(region_name=args.region)

# Create the EC2 resource in the desired region
ec2 = session.resource('ec2')

# Get a list of all instances in the desired region
instances = ec2.instances.all()

# Print the instance id and state of each instance
for instance in instances:
    print(instance.id, instance.state)
