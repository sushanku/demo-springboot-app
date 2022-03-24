FROM ubuntu:18.04 as builder
RUN sed -i 's/archive.ubuntu/np.archive.ubuntu/g' /etc/apt/sources.list && apt update && apt install --no-install-recommends openjdk-8-jdk maven -y

COPY . /spring-app

WORKDIR /spring-app

RUN mvn clean package
