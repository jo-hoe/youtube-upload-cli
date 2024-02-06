# Youtube Upload CLI

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
docker run --rm -it --entrypoint "" -v <folder to your video>:/mnt/ -v <folder to your secret>:/mnt/secrets -v <folder to your output>:/opt/yt-uploader/workdir/ -p 8080:8080 youtube-upload-cli youtubeuploader
```
