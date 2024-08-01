# DevSecOps Project

## Setup Netflix Clone on AWS using CI/CD, Security, Monitoring, and GitOps

### Commands Executed to Lay the Groundwork for the Project

#### Git Clone
```bash
git clone https://github.com/N4si/DevSecOps-Project.git
```

#### Install npm
```bash
sudo apt install npm -y
```

#### Install Docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

#### Configure Docker to Run Without sudo
```bash
sudo usermod -aG docker $USER  # Replace $USER with your system's username, e.g., 'ubuntu'
newgrp docker
sudo chmod 777 /var/run/docker.sock
```

#### Enable CLI Completion
```bash
sudo apt install bash-completion
source ~/.bashrc
```

#### Set Up Aliases
```bash
alias cls=clear
alias hist=history
alias d=docker  # Personal preference to save some time
```

#### Create the Netflix Container
```bash
docker run -d -p 8081:80 --name netflix netflix
```

#### Re-build Integrating the API Key
```bash
docker build --build-arg TMDB_V3_API_KEY=01119ab9b167e6 -t netflix .
```

#### For Testing Purposes
```bash
docker run -dp 8080:80 --name nginx_reinn nginx
docker ps
docker images
docker rm -f $(docker ps -aq)
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
```

#### Running Trivy as a Docker Container
##### Scan a Container Image for Vulnerabilities
```bash
docker run aquasec/trivy image python:3.4-alpine
```

---

This format uses headings, code blocks, and clear sectioning to improve readability and organization.

Citations:
[1] https://github.com/N4si/DevSecOps-Project.git
