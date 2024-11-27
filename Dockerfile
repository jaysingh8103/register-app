# Use the official Maven image to build the application
FROM maven:3.8.5-openjdk-11 AS build

# Set working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Build the Maven project and package it into a WAR file
RUN mvn clean package -DskipTests

# Use the official Tomcat image for the runtime
FROM tomcat:latest

# Copy the generated WAR file from the build stage to the Tomcat webapps directory
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
