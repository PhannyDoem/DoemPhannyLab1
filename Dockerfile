# Use Maven image to build the application
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use JRE image for runtime
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy the JAR file from build stage
COPY --from=build /app/target/DoemPhannyLab1-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8088

# Set environment variable for port
ENV PORT=8088

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]