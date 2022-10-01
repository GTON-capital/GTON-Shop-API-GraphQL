FROM golang:latest

RUN mkdir /app
WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download && go mod verify

COPY cmd /app/cmd
COPY doc /app/doc
COPY internal /app/internal
COPY tools /app/tools
COPY Makefile /app

RUN make -C /app

COPY config.json /app

CMD ["/app/build/artionapi", "-cfg", "/app/config.json"]