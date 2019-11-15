FROM maven:3.5.2-jdk-8-alpine as BUILD
COPY pom.xml /app/
COPY src /app/src/
WORKDIR /app
RUN mvn clean install -DskipTests


ARG RDS_HOSTNAME=aatr84cdou33y3.cgwif60fdqnp.us-east-2.rds.amazonaws.com
ARG RDS_PORT=3306
ARG RDS_DB_NAME=dbfargate
ARG RDS_USERNAME=root
ARG RDS_PASSWORD=tpm12345

ENV RDS_HOSTNAME $RDS_HOSTNAME
ENV RDS_PORT $RDS_PORT
ENV RDS_DB_NAME $RDS_DB_NAME
ENV RDS_USERNAME $RDS_USERNAME
ENV RDS_PASSWORD $RDS_PASSWORD


FROM openjdk:8-jre-alpine
ENV JAVA_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8787,suspend=n"
COPY --from=BUILD /app/target/*.jar  application.jar
EXPOSE 8800
ENTRYPOINT ["java $JAVA_OPTS ", "-jar", "-Dspring.profiles.active=dev, docker ", "/application.jar"]