FROM debian:latest

LABEL maintainer Rodrigo Silva Rodrigues <rsrodrigues.88@hotmail.com>

RUN mkdir app/

WORKDIR /app

#UPDATE IMAGE
RUN apt update && apt install -y bash
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

# Copie a aplicação para o contêiner
COPY eSUS-AB-PEC-5.1.17-Linux64.jar /app/

#LOCALE PT_BR
RUN curl -o /etc/locale.gen https://github.com/doug260188/project_esus/blob/master/locale #redo

#JAVA.CONF FILE
RUN curl -o /etc/java.conf https://github.com/doug260188/project_esus/blob/master/javaconf #redo

# Define o diretório de trabalho
WORKDIR /app/

# Comando para executar a aplicação
CMD ["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar", "-console", "-continue"]