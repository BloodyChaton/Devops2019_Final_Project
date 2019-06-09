FROM openjdk:12.0.1-jdk-oraclelinux7
ENTRYPOINT ["/usr/bin/java", "-jar", "/tmp/myservice.war", "--spring.data.mongodb.uri=mongodb://admin:admin@$10.29.0.10:27017/admin"]
# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /tmp/myservice.war