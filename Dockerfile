FROM golang:1.21.1-alpine3.18

WORKDIR /app

COPY . .

ENTRYPOINT [ "go", "run", "." ]
