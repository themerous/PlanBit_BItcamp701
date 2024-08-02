FROM tomcat:9.0.53-jdk17-openjdk
COPY target/my-app.war /usr/local/tomcat/webapps/ROOT.war