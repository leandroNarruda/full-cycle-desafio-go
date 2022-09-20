# Stage 1

FROM golang:1.18 as builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

# Stage 2

FROM scratch

COPY --from=builder /app/server /server

ENTRYPOINT [ "/server" ]


