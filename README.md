# Youtube Upload CLI

[![Docker Build](https://github.com/jo-hoe/youtube-upload-cli/actions/workflows/docker-build-test.yml/badge.svg)](https://github.com/jo-hoe/youtube-upload-cli/actions?workflow=docker-build-test)

Uses <https://github.com/porjo/youtubeuploader> to upload videos to youtube via CLI.

## Requirements

- [Docker](https://www.docker.com/)

## Build

```PowerShell
docker build -t youtube-upload-cli .
```

## Usage

see <https://github.com/porjo/youtubeuploader?tab=readme-ov-file#usage>

## Example how to run

```PowerShell
docker run --rm -it `
    -v <folder to video file>:/mnt/ `
    -v <folder to client_secret.json>:/home/ytuploader/.config/youtubeuploader/ `
    youtube-upload-cli `
    -filename "/mnt/test.mp4" `
    -title "My Title" `
    -description "My description" `
    -tags "tag1,tag2,tag3" `
    -secrets client_secret.json
```
