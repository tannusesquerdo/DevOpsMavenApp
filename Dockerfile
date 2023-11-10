# Use an official Maven image as a build stage
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package

# Use an official Tomcat image as a runtime stage
FROM tomcat:9.0-jdk11-openjdk-slim

# Copy the WAR file from the build stage to the Tomcat webapps directory
COPY --from=build /app/target/DevOpsMavenApp-*.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
