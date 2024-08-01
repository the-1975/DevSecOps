#!/bin/bash

# Docker Installation and Jenkins Setup

# Run Jenkins Docker Container
docker run -d --name jenkins --restart=on-failure \
-p 8080:8080 -v /var/jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker -e TZ=Asia/Seoul \
-u root jenkins/jenkins

# Check if Jenkins container is running
if [ "$(docker ps -q -f name=jenkins)" ]; then
    echo "Jenkins container is running."

    # Retrieve Initial Admin Password
    echo "Retrieving the initial admin password..."
    docker exec -it jenkins /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
else
    echo "Failed to start Jenkins container."
    exit 1
fi

# Display Jenkins URL
echo "Jenkins is available at: http://192.168.1.136:8080/login?from=%2F"
