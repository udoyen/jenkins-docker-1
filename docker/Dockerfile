ARG JENKINS_IMAGE
FROM ${JENKINS_IMAGE}

ARG DOCKER_HOST_GID
ARG DOCKER_CE_VERSION_STRING

USER root

RUN echo "Installing docker in container" && \
    apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        wget \
        git && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" && \
    apt-get update && \
    apt-get install -y \
        docker-ce-cli=${DOCKER_CE_VERSION_STRING} && \
    groupadd -g ${DOCKER_HOST_GID} docker && \
    usermod -a -G docker jenkins && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    touch /var/run/docker.sock && \
    chown root:docker /var/run/docker.sock
    
# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl

USER jenkins

WORKDIR /var/jenkins_home
