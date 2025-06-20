FROM alpine:latest

RUN apk add --no-cache git curl wget build-base nim bash libsass

RUN git clone https://github.com/zedeus/nitter.git /app
WORKDIR /app

RUN nimble build -y

EXPOSE 8080
CMD ["./nitter"]
