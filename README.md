# Youtube Upload CLI

## Build

```PowerShell
docker build -t youtube-upload-cli .
```

## Run

```PowerShell
docker run --rm -it --entrypoint "" -v <folder to your video>:/mnt/ -v <folder to your secret>:/mnt/secrets -v <folder to your output>:/opt/yt-uploader/workdir/ -p 8080:8080 youtube-upload-cli youtubeuploader
```
