# Build stage
FROM golang:1.21.1-alpine3.18 AS build

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" hello.go

# Run stage
FROM scratch

WORKDIR /app

COPY --from=build /app/hello .

ENTRYPOINT [ "./hello" ]
