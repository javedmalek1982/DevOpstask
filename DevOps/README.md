# Dev Server with Terraform

This repository contains a Vagrantfile that starts an Ubuntu server named "dev-server", sets a static IP address, sets a username and password for SSH access, and installs Terraform.

## Requirements
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)

## Usage
1. Clone this repository
2. Navigate to the repository in your terminal
3. Run `vagrant validate` to validate vagrantfile
3. Run `vagrant up` to start the virtual machine
4. SSH into the virtual machine with `vagrant ssh`
5. Terraform is installed and ready to use

## Configuration
- The static IP address of the virtual machine is `192.168.33.10`

- The username and password for SSH access is `vagrant:password`
- Terraform version 1.3.7 is installed
- The virtual machine has 2048MB of memory
