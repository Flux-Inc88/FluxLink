FROM eclipse-temurin:18-jre-jammy

# Create lavalink user
RUN groupadd -g 322 lavalink && \
    useradd -r -u 322 -g lavalink lavalink

WORKDIR /opt/Lavalink

RUN chown -R lavalink:lavalink /opt/Lavalink

USER lavalink

# Download Lavalink jar directly
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar Lavalink.jar

# Copy your application.yml
COPY application.yml .

ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.1,TLSv1.2", "-jar", "Lavalink.jar"]
