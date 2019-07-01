build:
	protoc -I. --go_out=plugins=micro:. --micro_out=plugins=micro:. proto/consignment/consignment.proto
	GOOS=linux GOARCH=amd64 go build -o consignment-service
	docker build -t shippy-service-consignment .
	rm -f consignment-service
run:
	docker run -p 50051:50051 -e MICRO_SERVER_ADDRESS=:50051 shippy-service-consignment