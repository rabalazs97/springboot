FROM maven:3.8.5-jdk-11

RUN -useradd -m -u 1000 -s /bin/bash jenkins

RUN yum install -y openssh-clients