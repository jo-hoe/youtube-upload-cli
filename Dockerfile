# Use a minimal base image as builder
FROM alpine:latest as builder

# Install Git and Go
RUN apk update && apk add --no-cache git go
# Set the working directory inside the container
WORKDIR /build

# Shallow clone repo and build it
RUN git clone --depth 1 https://github.com/porjo/youtubeuploader.git --branch 23.06 .
RUN go build -o youtubeuploader /build/cmd/youtubeuploader/main.go


# Actual image to setup environment
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

# Set the non-root user
USER ytuploader

ENTRYPOINT ["youtubeuploader"]
