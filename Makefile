COMMIT = $$(git describe --always)

.PHONY: build install test genmock
build:
	go build -o bin/spotscaler -ldflags "-X github.com/ryotarai/spotscaler/lib.GitCommit=$(COMMIT)"

install:
	go install -ldflags "-X github.com/ryotarai/spotscaler/lib.GitCommit=$(COMMIT)"

test:
	go test -v github.com/ryotarai/spotscaler/lib

genmock:
	mockgen -destination ec2/ec2_mock_test.go -package ec2 github.com/aws/aws-sdk-go/service/ec2/ec2iface EC2API
