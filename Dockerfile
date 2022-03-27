FROM openjdk:8-jre-alpine3.9

COPY ./target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo.jar

WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "demo.jar"]
