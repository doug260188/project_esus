FROM ubuntu:latest

LABEL maintainer Rodrigo Silva Rodrigues <rsrodrigues.88@hotmail.com>

#CREATE PEC FOLDER
RUN mkdir /home/PEC

#SET WORKDIR PEC FOLDER
WORKDIR /home/PEC

#UPDATE IMAGE
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y

#INSTALL PACKAGES
RUN apt-get install openjdk-8-jdk -y


#PEC INSTALL
RUN wget https://arquivos.esusab.ufsc.br/PEC/vRjsZJgfPyTBUpTy/5.1.17/eSUS-AB-PEC-5.1.17-Linux64.jar
RUN chmod 777 eSUS-AB-PEC-5.1.17-Linux64.jar
#RUN mv eSUS-AB-PEC-5.1.17-Linux64.jar /home/PEC/
#WORKDIR /home/PEC/

#LOCALE PT_BR
RUN curl -o /etc/locale.gen https://raw.githubusercontent.com/lissonpsantos2/pec-docker-image/master/locale #redo

#JAVA.CONF FILE
RUN curl -o /etc/java.conf https://raw.githubusercontent.com/lissonpsantos2/pec-docker-image/master/javaconf #redo

RUN apt-get install -y locales
RUN locale-gen
RUN sh instalador_linux.sh

WORKDIR /

ENTRYPOINT ["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar"]