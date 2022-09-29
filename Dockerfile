FROM golang:latest

RUN mkdir /app
WORKDIR /app

COPY ./cmd /app
COPY ./doc /app
COPY ./internal /app
COPY ./tools /app
COPY ./go.mod /app
COPY ./go.sum /app
COPY ./Makefile /app

RUN make

RUN cp doc/config.example.json /app/config.json

CMD /app/build/artionapi -cfg /app/config.json