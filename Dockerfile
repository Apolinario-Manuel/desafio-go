FROM golang:1.19-alpine3.16 as builder

WORKDIR /app

COPY . .

RUN go build main.go


FROM scratch

WORKDIR /

COPY --from=builder /app/main /main

ENTRYPOINT ["/main"]