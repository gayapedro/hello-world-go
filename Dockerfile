FROM golang:1.21.1

WORKDIR /app

COPY . .

ENTRYPOINT [ "go", "run", "." ]
