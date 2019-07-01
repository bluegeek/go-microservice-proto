build:
	protoc -I. --go_out=plugins=grpc:. proto/consignment/consignment.proto
	GOOS=linux GOARCH=amd64 go build -o consignment-service
	docker build -t shippy-service-consignment .
	rm -f consignment-service
run:
	docker run -p 50051:50051 shippy-service-consignment