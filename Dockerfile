FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# === Run Stage ===
FROM maven:3.9-eclipse-temurin-17
WORKDIR /app
COPY --from=build /app/target/*.jar server.jar
EXPOSE 8085
CMD ["java", "-jar", "server.jar"]