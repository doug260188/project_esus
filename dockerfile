FROM debian:latest

LABEL maintainer Rodrigo Silva Rodrigues <rsrodrigues.88@hotmail.com>

#UPDATE IMAGE
RUN apt update && apk add bash
RUN apt upgrade -y
RUN apt install nano -y
RUN apt install wget -y
RUN apt install curl -y

#INSTALL PACKAGES
RUN apt-get install openjdk-11-jdk -y


#PEC INSTALL
RUN wget https://arquivos.esusab.ufsc.br/PEC/vRjsZJgfPyTBUpTy/5.1.17/eSUS-AB-PEC-5.1.17-Linux64.jar
RUN chmod +x eSUS-AB-PEC-5.1.17-Linux64.jar
RUN ls -ltr ; pwd


#LOCALE PT_BR
RUN curl -o /etc/locale.gen https://github.com/doug260188/project_esus/blob/master/locale #redo

#JAVA.CONF FILE
RUN curl -o /etc/java.conf https://github.com/doug260188/project_esus/blob/master/javaconf #redo


CMD ["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar" "-console", "-continue"]

#ENTRYPOINT ["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar", "-console","-continue"]
