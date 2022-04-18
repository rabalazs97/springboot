FROM maven:3.8.5-jdk-11

RUN useradd -m -u 108 -s /bin/bash jenkins

ARG SSH_PRIVATE_KEY
ENV SSH_PRIVATE_KEY=${SSH_PRIVATE_KEY}

RUN mkdir -p /home/jenkins/.ssh
RUN chown -R jenkins:jenkins /home/jenkins/.ssh
RUN touch id_rsa 
RUN echo $SSH_PRIVATE_KEY

RUN apt-get install openssh-client -y