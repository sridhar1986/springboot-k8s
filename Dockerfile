# Stage 1: Build the application
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the project's files to the container
COPY . .

# Build the application using Maven
#RUN mvn clean install // This can be specified here or at the run step

FROM node:16
# Stage 2: Create a lightweight runtime image
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME


# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the builder stage to the runtime stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port the application will listen on

EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "app.jar"]
