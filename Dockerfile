FROM maven:3.6-jdk-8 as BUILD
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn clean package

FROM tomcat:7.0
COPY --from=BUILD /usr/src/myapp/target/Uber.war /usr/local/tomcat/webapps/Uber.war
EXPOSE 8080
