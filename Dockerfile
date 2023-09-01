FROM golang:1.21
ENV PORT 8080
EXPOSE 8080

WORKDIR /go/src/app
COPY . .

RUN go mod vendor
RUN go build -v -o app
RUN mv ./app /go/bin/

CMD ["app"]