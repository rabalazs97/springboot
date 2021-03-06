FROM maven:3.8.5-jdk-11

RUN useradd -m -u 108 -s /bin/bash jenkins

RUN mkdir -p /home/jenkins
RUN chown -R jenkins:jenkins /home/jenkins

RUN apt-get install openssh-client -y