# Stage 1: Build with Maven
FROM maven:3.8.4-openjdk-11 as build
WORKDIR /app
COPY . .
RUN mvn install

# Stage 2: Run with OpenJDK
FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/Uber.jar /app/
EXPOSE 9090
CMD ["java", "-jar", "Uber.jar"]

