# YouTube Upload CLI

[![Docker Build](https://github.com/jo-hoe/youtube-upload-cli/actions/workflows/docker-build-test.yml/badge.svg)](https://github.com/jo-hoe/youtube-upload-cli/actions?workflow=docker-build-test)

Wrapper for <https://github.com/porjo/youtubeuploader> to upload videos to YouTube via the CLI in a docker container.

## Prerequisites

Install the following:

- [Docker](https://www.docker.com/)

## How to use

The example below is a `PowerShell` command.

```PowerShell
docker run --rm -it `
    -v <folder to video file>:/mnt/ `
    -v <folder to client_secrets.json>:/home/ytuploader/.config/youtubeuploader/ `
    ghcr.io/jo-hoe/youtube-upload-cli:latest `
    -filename "/mnt/test.mp4" `
    -title "My Title" `
    -description "My description" `
    -tags "tag1,tag2,tag3"
```

And below is the same command in `bash`.

```bash
docker run --rm -it \
    -v <directory to video file>:/mnt/ \
    -v <directory to client_secrets.json>:/home/ytuploader/.config/youtubeuploader/ \
    ghcr.io/jo-hoe/youtube-upload-cli:latest \
    -filename "/mnt/test.mp4" \
    -title "My Title" \
    -description "My description" \
    -tags "tag1,tag2,tag3"
```

### First run

When running this for the first time, you need the `client_secrets.json` file.
How to create it is outlined [here](https://github.com/porjo/youtubeuploader/tree/cfb08f55fffb6d19f1d49f8c8a8804d7bc0366a9#youtube-api).

You must perform your OAuth authentication if you do not yet have the `request.token` file.
To create it, you should expose the port `8080`.
This can be done by adding `-p 8080:8080` to the command above.
After that, you can access [http://localhost:8080](http://localhost:8080) to perform the authentication.

## CLI Commands

For the complete list of commands, see <https://github.com/porjo/youtubeuploader/tree/cfb08f55fffb6d19f1d49f8c8a8804d7bc0366a9#usage>

## Caveats

### Youtube Upload Limit

Youtube limits the amount of calls you can do per day.
One upload counts for 1.600 credit.
And the default quota is 10.000 credits.
It works out to ~6 video uploads per day.
You can checkout your current quota [here](https://console.cloud.google.com/apis/api/youtube.googleapis.com/quotas).
One may apply for a quota increase [here](https://support.google.com/youtube/contact/yt_api_form?hl=en-GB).
