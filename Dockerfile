# Use a minimal base image as builder
FROM alpine:latest as builder
# Install Git
RUN apk update && apk add --no-cache git go
# Set the working directory inside the container
WORKDIR /build

RUN git clone https://github.com/porjo/youtubeuploader.git .
RUN go build -o youtubeuploader cmd/youtubeuploader/main.go 

# Use actual image to setup environment
FROM alpine:latest

# Set up the working directory and copy the binary
ARG folder="/opt/yt-uploader"
WORKDIR $folder/workdir/
COPY --from=builder /build/youtubeuploader $folder

# Set ownership to the non-root user
RUN adduser -D ytuploader
RUN chown -R ytuploader:ytuploader $folder

# Adding youtubeuploader to path
ENV PATH="${PATH}:$folder"

USER ytuploader
ENTRYPOINT ["youtubeuploader"]
