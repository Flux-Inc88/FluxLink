# -------- Stage 1: Build Lavalink --------
FROM gradle:8.8-jdk17 AS builder

WORKDIR /app
COPY . .
RUN ./gradlew :Lavalink-Server:bootJar -x test -x check

# -------- Stage 2: Run Lavalink --------
FROM eclipse-temurin:18-jre-jammy

RUN useradd -ms /bin/bash lavalink
USER lavalink
WORKDIR /opt/Lavalink

# Copy final built JAR
COPY --from=builder /app/LavalinkServer/build/libs/Lavalink.jar Lavalink.jar

# Copy configuration
COPY LavalinkServer/application.yml /opt/Lavalink/application.yml

ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-jar", "Lavalink.jar"]
