FROM ghcr.io/gkedu/openjdk:8u212-jdk
COPY target/*SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Xmx400M","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=docker"]
# Maven 설치 (선택사항)
RUN apt-get update && apt-get install -y maven
# 애플리케이션 복사
COPY target/*.jar app.jar
# 기본 실행 명령
ENTRYPOINT ["java", "-jar", "app.jar"]