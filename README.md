# dockerpush_script
Docker Image Push Automation Script
-------------------------------------------------
This repository contains a shell script that automates the process of pushing Docker images to Docker Hub. The script prompts the user for Docker Hub credentials, the local image name, and the Docker Hub repository name. It then logs in, tags the image (if not already tagged with the username), pushes the image to Docker Hub, and logs out.

Prerequisites
----------------------------------------------
Docker installed on your machine.
A Docker Hub account.

Usage
------------------------------------------------------------------
Clone the Repository:
git clone https://github.com/bryko254/dockerpush_script.git
cd dockerpush_script

Make the Script Executable:
------------------------------------------------------------------
chmod +x docker_push.sh

Run the Script:
./docker_push.sh
