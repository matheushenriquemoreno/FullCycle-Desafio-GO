FROM golang:alpine3.20 as golang

WORKDIR /usr/src/app

COPY olamundo.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build olamundo.go

FROM scratch

COPY --from=golang /usr/src/app /

ENTRYPOINT [ "/olamundo"]