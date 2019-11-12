FROM maven:3.5.2-jdk-8-alpine as BUILD
COPY pom.xml /app/
COPY src /app/src/
WORKDIR /app
RUN mvn clean install -DskipTests
 
FROM openjdk:8-jre-alpine
ENV JAVA_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8787,suspend=n"
COPY --from=BUILD /app/target/*.jar  application.jar
EXPOSE 8800
ENTRYPOINT ["java $JAVA_OPTS ", "-jar", "-Dspring.profiles.active=dev, docker ", "/application.jar"]