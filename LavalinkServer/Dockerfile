# LavalinkServer/docker/Dockerfile

FROM eclipse-temurin:18-jre-jammy

# Create user
RUN groupadd -g 322 lavalink && \
    useradd -r -u 322 -g lavalink lavalink

WORKDIR /app

# Copy everything from LavalinkServer (the parent of docker/) into /app
COPY .. .

RUN chown -R lavalink:lavalink /app

USER lavalink

RUN ./gradlew clean build -x check -x test

COPY build/libs/Lavalink.jar Lavalink.jar

ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-jar", "Lavalink.jar"]
