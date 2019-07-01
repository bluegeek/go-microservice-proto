FROM alpine:latest

RUN mkdir /app
WORKDIR /app
ADD consignment-service /app/consignment-service
RUN chmod a+x ./consignment-service
CMD ["./consignment-service"]