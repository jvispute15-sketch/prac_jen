# Dockerfile
FROM eclipse-temurin:latest
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
