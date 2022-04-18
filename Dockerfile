FROM maven:3.8.5-jdk-11

RUN useradd -m -u 108 -s /bin/bash jenkins

ENV PK

RUN mkdir -p /home/jenkins/.ssh
RUN chown -R jenkins:jenkins /home/jenkins/.ssh
RUN touch id_rsa 
RUN echo "$PK" > /home/jenkins/.ssh/id_rsa

RUN apt-get install openssh-client -y