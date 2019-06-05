FROM openjdk:13
# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /tmp/myservice.war
ENTRYPOINT ["java","-jar","restfulweb-1.0.0-SNAPSHOT.jar","–spring.data.mongodb.uri=mongodb://costumer3:costumer3@192.168.60.4:27017/costumer"]