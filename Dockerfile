From ubuntu:18.04 as builder
RUN sed -i 's/archive.ubuntu/np.archive.ubuntu/g' /etc/apt/sources.list && apt update && apt install --no-install-recommends openjdk-8-jdk maven -y

COPY . /spring-app

WORKDIR /spring-app

RUN mvn clean package

FROM openjdk:8-jre-alpine3.9

COPY --from=builder /spring-app/target/demo-0.0.1-SNAPSHOT.jar /demo.jar

CMD ["java", "-jar", "/demo.jar"]
