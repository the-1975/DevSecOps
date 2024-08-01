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

![Screenshot 2024-07-25 103938](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20103938.png?raw=true)

![Screenshot 2024-07-25 104013](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20104013.png?raw=true)

![Screenshot 2024-07-25 104352](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20104352.png?raw=true)

![Screenshot 2024-07-25 104610](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20104610.png?raw=true)

![Screenshot 2024-07-25 105005](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20105005.png?raw=true)

![Screenshot 2024-07-25 105017](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20105017.png?raw=true)

![Screenshot 2024-07-25 105926](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20105926.png?raw=true)

![Screenshot 2024-07-25 105931](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20105931.png?raw=true)

![Screenshot 2024-07-25 110711](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20110711.png?raw=true)

![Screenshot 2024-07-25 110728](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20110728.png?raw=true)

![Screenshot 2024-07-25 110833](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20110833.png?raw=true)

![Screenshot 2024-07-25 111254](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20111254.png?raw=true)

![Screenshot 2024-07-25 111837](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20111837.png?raw=true)

![Screenshot 2024-07-25 111846](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20111846.png?raw=true)

![Screenshot 2024-07-25 111921](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20111921.png?raw=true)

![Screenshot 2024-07-25 111944](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20111944.png?raw=true)

![Screenshot 2024-07-25 112004](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112004.png?raw=true)

![Screenshot 2024-07-25 112108](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112108.png?raw=true)

![Screenshot 2024-07-25 112120](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112120.png?raw=true)

![Screenshot 2024-07-25 112143](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112143.png?raw=true)

![Screenshot 2024-07-25 112250](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112250.png?raw=true)

![Screenshot 2024-07-25 112358](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112358.png?raw=true)

![Screenshot 2024-07-25 112438](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112438.png?raw=true)

![Screenshot 2024-07-25 112618](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112618.png?raw=true)

![Screenshot 2024-07-25 112810](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112810.png?raw=true)

![Screenshot 2024-07-25 112833](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-25%20112833.png?raw=true)

![Screenshot 2024-07-26 093047](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20093047.png?raw=true)

![Screenshot 2024-07-26 093056](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20093056.png?raw=true)

![Screenshot 2024-07-26 093438](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20093438.png?raw=true)

![Screenshot 2024-07-26 133439](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20133439.png?raw=true)

![Screenshot 2024-07-26 133510](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20133510.png?raw=true)

![Screenshot 2024-07-26 134747](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20134747.png?raw=true)

![Screenshot 2024-07-26 134937](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20134937.png?raw=true)

![Screenshot 2024-07-26 134940](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20134940.png?raw=true)

![Screenshot 2024-07-26 135147](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20135147.png?raw=true)

![Screenshot 2024-07-26 135251](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20135251.png?raw=true)

![Screenshot 2024-07-26 151339](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20151339.png?raw=true)

![Screenshot 2024-07-26 161142](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20161142.png?raw=true)

![Screenshot 2024-07-26 161447](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20161447.png?raw=true)

![Screenshot 2024-07-26 161541](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-26%20161541.png?raw=true)

![Screenshot 2024-07-29 085134](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-29%20085134.png?raw=true)

![Screenshot 2024-07-29 085222](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-29%20085222.png?raw=true)

![Screenshot 2024-07-29 085246](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-29%20085246.png?raw=true)

![Screenshot 2024-07-29 090420](https://github.com/the-1975/DevSecOps/blob/images/Netflix-clone-project/Screenshot%202024-07-29%20090420.png?raw=true)
