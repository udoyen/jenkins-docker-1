ARG JENKINS_IMAGE
FROM ${JENKINS_IMAGE}

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
        docker-ce=${DOCKER_CE_VERSION_STRING} \
        docker-ce-cli=${DOCKER_CE_VERSION_STRING} \
        containerd.io && \
    usermod -a -G docker jenkins && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

WORKDIR /var/jenkins_home