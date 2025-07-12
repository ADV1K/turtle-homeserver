FROM alpine:latest AS builder

RUN apk add --no-cache go && \
    go install github.com/jpillora/installer@latest

FROM alpine:latest
COPY --from=builder /root/go/bin/installer /usr/local/bin/installer

EXPOSE 3000
CMD ["installer", "-user", "adv1k"]

