# Youtube Upload CLI

[![Docker Build](https://github.com/jo-hoe/youtube-upload-cli/actions/workflows/docker-build-test.yml/badge.svg)](https://github.com/jo-hoe/youtube-upload-cli/actions?workflow=docker-build-test)

Uses [youtubeuploader](https://github.com/porjo/youtubeuploader) to upload videos to youtube.

## Requirements

- [Docker](https://www.docker.com/)

## Build

```PowerShell
docker build -t youtube-upload-cli .
```

## Usage

see <https://github.com/porjo/youtubeuploader?tab=readme-ov-file#usage>

## Run

```PowerShell
docker run --rm -it ` 
    --entrypoint "" ` 
    -v <folder to your video>:/mnt/ ` 
    -v <folder to your secret>:/mnt/secret_cache/ `
    -v <folder to your output>:/opt/yt-uploader/workdir/ `
    -p 8080:8080 ` 
    youtube-upload-cli `
    youtubeuploader
```
