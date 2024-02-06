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

### First run

When running this first you have need the `client_secret.json` file.
How to create it is outlined [here](https://github.com/porjo/youtubeuploader/tree/cfb08f55fffb6d19f1d49f8c8a8804d7bc0366a9#youtube-api).

You will need to perform you OAuth authentication in case you do not yet have the `request.token` file.
To create it you should expose the port 8080.
This can be done by adding `-p 8080:8080` to the command above.
After you can access <localhost:8080> to perform the authentication.
