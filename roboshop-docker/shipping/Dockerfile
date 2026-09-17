FROM maven AS builder

WORKDIR /opt/server

COPY pom.xml .

COPY src /opt/server/src

RUN mvn clean package

FROM eclipse-temurin:17-jre-alpine

EXPOSE 8080

WORKDIR /opt/server

RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

ENV CART_ENDPOINT="CART:8080" \
    DB_HOST="MYSQL"

COPY --from=builder /opt/server/target/shipping-*.jar /opt/server/shipping.jar

USER roboshop

CMD ["java", "-jar", "shipping.jar"]




# FROM maven
# WORKDIR /opt/server
# COPY pom.xml .
# COPY src /opt/server/src
# RUN mvn clean package
# RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar 
# ENV CART_ENDPOINT="CART:8080" \
#     DB_HOST="MYSQL" 
# CMD ["java", "-jar", "shipping.jar"]