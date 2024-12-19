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

RUN mv public 

FROM nginx AS exec

ENV NGINX_HOST="ed-henrique.com"
ENV NGINX_PORT=80

COPY --from=builder /app/public /usr/share/nginx/html
