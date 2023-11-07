FROM alpine:latest
WORKDIR /home/go
ADD k8s-delete-validation-webhook.bin /home/go/k8s-delete-validation-webhook.bin
ENTRYPOINT ["/home/go/k8s-delete-validation-webhook.bin", "webhook"]
