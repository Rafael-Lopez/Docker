# To build image: docker build -t message-server .
# The . at the end of the docker build command tells that Docker should look for the Dockerfile in the current directory.
# Or you can specify a Dockerfile elsewhere with -f

# To run container: docker run -p8887:8080 message-server

FROM openjdk:8-jdk-alpine
COPY target/message-server-0.0.1-SNAPSHOT.jar message-server-1.0.0.jar
ENTRYPOINT ["java","-jar","/message-server-1.0.0.jar"]