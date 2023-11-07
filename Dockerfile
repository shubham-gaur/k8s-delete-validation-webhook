FROM golang:1.21-bookworm AS builder
WORKDIR /home/go
COPY ./ /home/go/
RUN go mod tidy && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o k8s-delete-validation-webhook.bin

FROM alpine:latest
WORKDIR /home/go
COPY --from=builder /home/go/k8s-delete-validation-webhook.bin /home/go/k8s-delete-validation-webhook.bin
ENTRYPOINT ["/home/go/k8s-delete-validation-webhook.bin", "webhook"]
