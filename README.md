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
    ghcr.io/jo-hoe/youtube-upload-cli:latest `
    -filename "/mnt/test.mp4" `
    -title "My Title" `
    -description "My description" `
    -tags "tag1,tag2,tag3" `
```

### First run

When running this first you have need the `client_secrets.json` file.
How to create it is outlined [here](https://github.com/porjo/youtubeuploader/tree/cfb08f55fffb6d19f1d49f8c8a8804d7bc0366a9#youtube-api).

You will need to perform you OAuth authentication in case you do not yet have the `request.token` file.
To create it you should expose the port 8080.
This can be done by adding `-p 8080:8080` to the command above.
After you can access <localhost:8080> to perform the authentication.

## Caveats

### Youtube Upload Limit

Youtube limits the amount of calls you can do per day.
One upload counts for 1.600 credit.
And the default quota is 10.000 credits.
It works out to ~6 video uploads per day.
You can checkout your current quota [here](https://console.cloud.google.com/apis/api/youtube.googleapis.com/quotas).
One may apply for a quota increase [here](https://support.google.com/youtube/contact/yt_api_form?hl=en-GB).
