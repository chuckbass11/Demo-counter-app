FROM maven as build 
WORKDIR /app
COPY . .
RUN  mv install

FROM opejdk:11.0
WORKDIR /app
COPY --FROM=BUILD /app/target/Uber.jar/app/
EXPOSE 9090
CMD [ "Java","-jar","Uber.jar" ]