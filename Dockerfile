FROM maven:3.9-amazoncorretto-21-debian

RUN mkdir mock

WORKDIR mock

COPY . .

RUN mvn install

CMD ["java", "-jar", "target/mock.jar"]