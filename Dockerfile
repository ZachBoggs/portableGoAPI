FROM golang:1.25-trixie AS base



WORKDIR /build

# copying over the files from the current directory into the docker container
COPY . .

# Install dependencies for our go program
RUN go mod init go-module
RUN go mod tidy

WORKDIR .

# building the program
RUN CGO_ENABLED=0 GOOS=linux go build -o /build/go-program

# exposing port 80, I can also choose to use 8080 for http traffic but the automatic tester uses port 80
EXPOSE 80

# Start the application
CMD ["/build/go-program"]
