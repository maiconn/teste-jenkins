FROM openjdk:17-alpine 
WORKDIR ./

COPY target/*.jar jenkins-teste.jar

EXPOSE 8082
ENTRYPOINT ["java","-jar","/jenkins-teste.jar"]