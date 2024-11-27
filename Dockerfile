# Use the official Apache Tomcat image
FROM tomcat:latest

# Ensure the default webapps are available
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Copy the WAR file into the Tomcat webapps directory
COPY webapp/target/*.war /usr/local/tomcat/webapps/
