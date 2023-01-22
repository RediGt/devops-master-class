# INSTALL JENKINS ON MAC
# -----------------------------
# See instructions here:
https://www.jenkins.io/doc/book/installing/docker/#setup-wizard

# 1) Create a bridge network in Docker:
docker network create jenkins
docker network ls

# 2) To execute Docker commands inside Jenkins nodes, run the docker:dind 
#       Docker image
docker run \
    --name jenkins-docker \
    --rm --detach \
    --privileged \
    --network jenkins \
    --network-alias docker \
    --env DOCKER_TLS_CERTDIR=/certs \
    --volume jenkins-docker-certs:/certs/client \
    --volume jenkins-data:/var/jenkins_home \
    --publish 2376:2376 \
    docker:dind \
    --storage-driver overlay2

# 3) Create Jenkins Dockerfile
# 4) Build a new docker image from this Dockerfile and assign the image a 
#       meaningful name, e.g. "myjenkins-blueocean:2.375.2-1"
docker build -t myjenkins-blueocean:2.375.2-1 .

# 5) Run your own myjenkins-blueocean:2.375.2-1 image
docker run \
    --name jenkins-blueocean \
    --restart=on-failure \
    --detach \
    --network jenkins \
    --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client \
    --env DOCKER_TLS_VERIFY=1 \
    --publish 8081:8080 \
    --publish 50000:50000 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    myjenkins-blueocean:2.375.2-1


# RUN JENKINS
# -----------------------------
# 6) Get the password
docker exec b6bef242de59 cat /var/jenkins_home/secrets/initialAdminPassword

# 7) Goto http://localhost:8081
# 8) In UI: Install suggested plugins
# 9) Create GitHub Repo "jenkins-devops-microservice" for pipelining