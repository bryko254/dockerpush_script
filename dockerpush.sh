#!/bin/bash

# Prompt for Docker Hub credentials
read -p "Enter Docker Hub username: " dockerhub_username
read -sp "Enter Docker Hub password: " dockerhub_password
echo

# Login to Docker
echo "Logging in to Docker..."
echo $dockerhub_password | docker login -u $dockerhub_username --password-stdin

# Check if login was successful
if [ $? -ne 0 ]; then
    echo "Docker login failed. Exiting."
    exit 1
fi

# Prompt for image details
read -p "Enter the name of the local image (e.g. myapp:v1): " local_image
read -p "Enter the name for Docker Hub repository (e.g. myrepo): " dockerhub_repo

# Check if the image is already tagged with the username
if [[ $local_image != "$dockerhub_username/"* ]]; then
    # Tag the image with the Docker Hub username
    dockerhub_image="$dockerhub_username/$dockerhub_repo"
    echo "Tagging image as $dockerhub_image..."
    docker tag $local_image $dockerhub_image
else
    dockerhub_image=$local_image
fi

# Push the image to Docker Hub
echo "Pushing $dockerhub_image to Docker Hub..."
docker push $dockerhub_image

# Logout from Docker
echo "Logging out from Docker..."
docker logout

echo "Done!"

