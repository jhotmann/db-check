FROM golang:1 AS builder

WORKDIR /app
COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o /dbcheck

FROM busybox

COPY --from=builder /dbcheck /dbcheck

CMD [ "sleep", "infinity" ]