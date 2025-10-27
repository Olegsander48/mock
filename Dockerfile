# Этап 1 - сборка проекта в jar
FROM maven:3.9-amazoncorretto-21-debian AS maven
WORKDIR /mock
COPY . /mock
RUN mvn install

# Этап 2 - указание как запустить проект
FROM amazoncorretto:21
WORKDIR /mock
COPY --from=maven /mock/target/mock.jar mock.jar
CMD ["java", "-jar", "mock.jar"]