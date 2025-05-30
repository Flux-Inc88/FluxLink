# -------- Stage 1: Build Lavalink --------
FROM gradle:8.8-jdk17 AS builder

WORKDIR /app
COPY . .

RUN ./gradlew :Lavalink-Server:build -x test -x check

# -------- Stage 2: Run Lavalink --------
FROM eclipse-temurin:18-jre-jammy

RUN groupadd -g 322 lavalink && \
    useradd -r -u 322 -g lavalink lavalink

WORKDIR /opt/Lavalink

COPY --from=builder /app/Lavalink-Server/build/libs/Lavalink.jar Lavalink.jar
COPY Lavalink-Server/application.yml /opt/Lavalink/application.yml

USER lavalink

ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-jar", "Lavalink.jar"]
