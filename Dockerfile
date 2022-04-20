FROM maven:3.8.5-jdk-11

ENV PK = "-----BEGIN RSA PRIVATE KEY-----\
MIIEogIBAAKCAQEAuxfRROcsdG6bsUo6emfuQUg/fjuJTclfcvQoLXvbKBz8+w89\
v2PUwu1SkvYPItrkpyzuDsYxotnWQ80TahRhUSTaylUSzhChAIErotHA9CyIbShc\
XRzw1hl24xKW+aP3jnQnxWXqcJbjiIf9z87EfTGPP6ec0Ba2yKpZsHogem7ryWs2\
yXQKo3rogV/4unXBKXRfjypl4ubWDvdhG6Ao/rgUSp6VhezgWc48VisYDbvchdd3\
Oq7DkSZ5T6ehfcT8QPltFUQ614VO96eMdo/sKWZdAorV7nSQIaJqSqACbbJkZwvq\
xRDOn0HwoY/uDZ2WqNPrZE3XyNj9oObTrQM9lwIDAQABAoIBADZzriKBrbyNXJ7y\
3aY2jW9Ombwhk8qh6zfHu9HRFG3OUgq32t7TLV82NywylSEt2BKXzwlZwaSGBghh\
rV7YY6J8OXld3UVALbu53Htc1O278FDkyE0JWUbWznU0OeCaSjiZseGP0fXG1J4u\
Bj7vDNzrCagbHlap5bTtb4Efakh3dJ2EmPqtAKteVfpB1K0ICgxIzHD3tw9ifEDK\
JkWmVBjcZUdPFyucaHRY8zR/qG5+UBOiaZ8qIlx542bdpjNQCSg1mLN1DUlBAUpl\
g2d6VQGHw5qjHGEu1i/djVD44ai69/V9HMgHI2vuseMW3yIEls77+cBUgpCw4zC9\
drvac2ECgYEA3bW/ofKGiTQCmIpUPq/XiQ6+mMJHwD1nhCgPc+eKPEUq5rJuFf0I\
fPOzW6Y+RYjsvkYDUdhm1WrrEhyZMbDB8BDfz0qpf38FwQTG/UlPhAuqIt8y//Hp\
yTZaQtPvd0Fks0zwxgyNGO8FgeZ1m3ljZTT4iPLpa0O9d0NL7ZzWg78CgYEA2Ad3\
okVOQYSHMSsYu6P2JEo8wma4Lmw4ik74XfItrxrFAmGqria7zRGjfJ/jajSemwP2\
by41jJ8Fej9qtUHUJZrRJ8a3LNwhrYYgSW0Bv8KDVPm6JcJpO2FyjMnK11TT5Yv1\
erW5Un1k6fgbO3SVVx5n3riaT/Fs97N3a2aQ3CkCgYArbjz51m5wVhXkF8Tk+sE4\
AgFoHza6+8xZYReV1teHcu0yf+V8vTJ6d6q821X7fRUTONfRopiSWf1ucNe5miyD\
gGq3SqLlbNaNtwfb+g5viXFsn1h4NsVbOyB3Utjn/ZFiZkIMKc1CAyCLD8AeEqtb\
2gKNoTgEYSKuSCqJg12qNQKBgCPWWUpaJPlJewP1Gk1GjfbHOf0l/Tf2TArlvt4W\
5u09i6ExgpcRZeZHHs/11kwwHn+o0KDxEYEagFYfXxxip0b1v+zRUmHmws9+iKyl\
oLynEBJwuyi4b6yiJdalQzkloWFbLoYEz5GXq74Eor/iP0QMjz6rcS4B5wnQg+cV\
RMLBAoGAcOKNZ9uUAJwmMhekvEXgcDHV+df2o+DCwvNGuvyM/0jesy90vJ4Jb94b\
YnfAkQyIT9dcqYQQUpiN/i82iOJEUA/mXsOyCILaukSO2GcZU34VJYVPBhNMV6WV\
rEQhIJmuwb4wjfceeEuCpXW+5/3Gcxi4d4pvUyv7lOiUQD2gXA0=\
-----END RSA PRIVATE KEY-----\
"

RUN useradd -m -u 108 -s /bin/bash jenkins

RUN mkdir -p /home/jenkins/.ssh
RUN chown -R jenkins:jenkins /home/jenkins/.ssh
RUN chmod -R 777 /home/jenkins/.ssh
RUN touch /home/jenkins/.ssh/id_rsa
RUN echo $PK > /home/jenkins/.ssh/id_rsa
RUN ls -la /home/jenkins/.ssh

RUN apt-get install openssh-client -y