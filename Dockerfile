FROM golang:1.25-trixie AS base


WORKDIR /build

# Install dependencies for our go program
RUN go mod init apiCode
RUN go mod download

# copying the source files into the container
COPY ../cmd/gateway/*.go ./

# building the program
RUN CGO_ENABLED=0 GOOS=linux go build -o go-program

# exposing port 80, I can also choose to use 8080 for http traffic
EXPOSE 80

# Start the application
CMD ["/build/go-program"]
