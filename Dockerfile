FROM go:1.23.4-alpine3.21 AS builder

ENV GOBIN "/app"

WORKDIR /app

COPY package*.json .

RUN apk add --no-cache npm && \
    npm install -g sass sass-embedded && \
    npm install && \
    CGO_ENABLED=1 go install -tags extended,withdeploy github.com/gohugoio/hugo@latest

COPY . .

RUN hugo --gc --minify

FROM caddy:2.9-alpine
