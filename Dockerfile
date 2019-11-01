# This first stage is defined as build_base, and referenced by second build
FROM golang:1.13.3 AS build_base

ENV GO111MODULE=on

WORKDIR /go/src/github.com/cferri-gr8/k8s-demo

COPY go.mod go.sum ./

# Add project dependencies
RUN go mod download

COPY . .

# Build
RUN CGO_ENABLED=0 go build -o /go/src/github.com/cferri-gr8/k8s-demo/bin/goapp main.go

# Start fresh from a smaller image
FROM alpine

WORKDIR /app

# Copy the binary 'goapp' from /app into current build's /app directory
COPY --from=build_base /go/src/github.com/cferri-gr8/k8s-demo/bin .

EXPOSE 8080

# Run the binary program produced by the build step
CMD ["./goapp"]

