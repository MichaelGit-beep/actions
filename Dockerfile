FROM golang:1.20.1-alpine3.17 AS builder
WORKDIR /app
COPY *go .
COPY go.mod .
RUN go build -o main .

FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT ["./main"]
