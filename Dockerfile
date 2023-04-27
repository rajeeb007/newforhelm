FROM openjdk
WORKDIR /app
COPY target/new-*.jar /app/
RUN echo "heloo world"
CMD ["java", "-jar","new-1.0-SNAPSHOT.jar"]