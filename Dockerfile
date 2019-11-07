FROM maven:3.5-jdk-8 AS build
COPY src /usr/sdustakar/src
COPY pom.xml /usr/sdustakar
RUN mvn -f /usr/sdustakar/pom.xml clean package
EXPOSE 8083
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mangodb:27017/quizdb","-Deureka.client.serviceUrl.defaultZone=http://quiz-registry-service:8081/eureka/","-jar","/usr/sdustakar/target/quiz-question-service-1.0.0.jar"]