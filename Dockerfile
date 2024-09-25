FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#Docker image
FROM openjdk:17.0.1-jdk-slim 

#Copy the compiled jar file with maven and copy it the docker container
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar

#The port will will run the webapp on it
EXPOSE 8080

ENTRYPOINT ["java","-jar","demo.jar"]
