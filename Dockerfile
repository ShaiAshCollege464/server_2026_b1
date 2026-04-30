FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# === Run Stage ===
FROM eclipse-temurin:17
WORKDIR /app
COPY --from=build /app/target/*.jar server.jar
EXPOSE 8085
CMD ["java", "-jar", "server.jar"]