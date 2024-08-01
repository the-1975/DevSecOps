# DevSecOps
DevSecOps Project to setup Netflix clone on AWS using CICD, Security, Monitoring and GitOps

Here is a list of commands executed to lay the groundwork for the project:
# Git clone
https://github.com/N4si/DevSecOps-Project.git

# Install npm
sudo apt install npm -y 

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Without sudo
sudo usermod -aG docker $USER  # Replace with your system's username, e.g., 'ubuntu'
newgrp docker
sudo chmod 777 /var/run/docker.sock

# CLI completion
sudo apt install bash-completion
source ~/.bashrc

#alias
alias cls=clear
alias hist=history
alias d=docker # personal preference to save some time

# Create the container
docker run -d -p 8081:80 --name netflix netflix

# API Key for TMDB
01119ab9b167e67a13bd1a957defc40b

# Re-build integrating the api key
d build --build-arg TMDB_V3_API_KEY=01119ab9b167e67a13bd1a957defc40b -t netflix .

# for testing purposes
docker run -dp 8080:80 --name nginx_reinn nginx
docker ps
docker images
docker rm -f $(docker ps -aq)
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)

# Running Trivy as a docker container
# Scan a container image for vulnerabilities
docker run aquasec/trivy image python:3.4-alpine
