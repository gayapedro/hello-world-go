FROM golang:1.21.1-alpine3.18 AS build

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" hello.go

FROM gcr.io/distroless/static-debian11

WORKDIR /app

COPY --from=build /app/hello .

ENTRYPOINT [ "./hello" ]
