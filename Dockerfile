FROM golang:1.21.1-alpine3.18 AS build

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" hello.go

FROM busybox:1.35.0-uclibc

WORKDIR /app

COPY --from=build /app/hello .

ENTRYPOINT [ "./hello" ]
