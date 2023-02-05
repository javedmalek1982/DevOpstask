# Define the local provider to manage files and directories on the Ubuntu server
provider "local" {
}

# Set a local variable for the data root directory
locals {
  data_root = "/data/docker"
}

# Create the /etc/docker/ directory
resource "local_file" "docker_directory" {
     filename = "/etc/docker/daemon.json"
     content  = ""
}

# Create a Docker configuration file as a template
data "template_file" "docker_daemon_json" {

  template = "/etc/docker/daemon.json"
  vars = {
    data-root = "${local.data_root}"
  }
}


# Install Docker 19.03.1 in the Ubuntu system
resource "null_resource" "install_docker" {
  # Use a provisioner to run a shell script to install Docker
  provisioner "local-exec" {
      command = "sudo apt-get update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y "
  }
  provisioner "local-exec" {        
      command = "sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" && sudo apt-get update && sudo apt-get install -y docker-ce=5:23.0.0-1~ubuntu.20.04~focal"
   }

   provisioner "local-exec" {
       command = "sudo service docker restart && sudo systemctl enable docker && sudo systemctl restart docker"
  }
    # Wait for the Docker directory to be created
  depends_on = [
    local_file.docker_directory,
  ]
}

