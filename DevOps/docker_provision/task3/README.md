Make sure you have Docker installed on your computer.
Clone or download the repository containing the Dockerfile and aws-cli.py script.
In the same directory as the Dockerfile, create a directory called .aws and within that directory, create a file called credentials with your AWS access key ID and secret access key.
Open a terminal and navigate to the directory where the Dockerfile is located.
Build the Docker image using the command docker build -t aws-cli ..
Run the Docker container using the command docker run --rm -e REGION=us-west-2 aws-cli.
The script will list the EC2 instances in the us-west-2 region and print their instance id and state.
The container will then be stopped after the list has been printed.

# Result of the Script
sudo docker run -v ~/.aws:/root/.aws aws-cli python3 aws-cli.py --region ap-south-1 
i-08071911e5b34d409 {'Code': 80, 'Name': 'stopped'}
i-0b5a724c834cb3870 {'Code': 80, 'Name': 'stopped'}
i-0ae68312e36cbfd4f {'Code': 80, 'Name': 'stopped'}