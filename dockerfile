FROM lissonpsantos2/debian-jessie-basic:latest

LABEL maintainer Rodrigo Silva Rodrigues <rsrodrigues.88@hotmail.com>

#CREATE PEC FOLDER
RUN mkdir /home/PEC

#SET WORKDIR PEC 3.0 FOLDER
WORKDIR /home/PEC

#UPDATE IMAGE
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y

#INSTALL PACKAGES
RUN apt-get install openjdk-8-jdk -y

#IMAGE VARIABLES
ENV PEC_FOLDER mkdir -p /var/lock/subsys/ && service e-SUS-AB-PostgreSQL restart && service e-SUS-AB-PostgreSQL start 

#PEC INSTALL
RUN wget hhttps://arquivos.esusab.ufsc.br/PEC/vRjsZJgfPyTBUpTy/5.1.17/eSUS-AB-PEC-5.1.17-Linux64.jar -O pec.jar
RUN chmod 777 pec.jar
RUN mv pec.jar /home/PEC/install
WORKDIR /home/PEC/install

#LOCALE PT_BR
RUN curl -o /etc/locale.gen https://raw.githubusercontent.com/lissonpsantos2/pec-docker-image/master/locale #redo

#JAVA.CONF FILE
RUN curl -o /etc/java.conf https://raw.githubusercontent.com/lissonpsantos2/pec-docker-image/master/javaconf #redo

RUN apt-get install -y locales
RUN locale-gen
RUN sh instalador_linux.sh

WORKDIR /

ENTRYPOINT mkdir -p /var/lock/subsys/ && service e-SUS-AB-PostgreSQL restart && service e-SUS-AB-PostgreSQL start && java -jar /home/PEC/pec.jar ; /bin/bash
