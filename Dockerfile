FROM golang:alpine AS builder

ENV GOBIN="/app"

WORKDIR /app

COPY package*.json .
COPY go.mod .
COPY go.sum .

RUN apk add --no-cache npm build-base git ca-certificates
RUN npm install -g sass sass-embedded && npm install
RUN go mod download

RUN CGO_ENABLED=1 go install -tags extended,withdeploy github.com/gohugoio/hugo@latest

COPY . .

RUN /app/hugo --gc --minify

FROM nginx AS exec

ENV NGINX_HOST="ed-henrique.com"
ENV NGINX_PORT="80"

COPY --from=builder /app/public /usr/share/nginx/html
