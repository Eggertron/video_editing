# Samsung Gear 360
Before recording 360 videos on the Gear 360 camera, be sure to check that the video record 
settings are correct. If the battery runs out on the Gear 360 camera the settings can reset 
to the default settings, like the ones below.

## Gear 360 Phone App Stabilization
The Gear 360 Smart Phone App has video stabilization which is not available in the 
Gear 360 ActionDirector Software. Enable the Stabilize option from in the Gallery Settings of 
the Gear 360 Smart Phone App and download the video from the camera to the smart phone to 
stabilize the videos that require stabilization. This is highly recommended for videos that 
are not stationary!

## Gear 360 Camera 360 Video Properties
The Gear 360 Camera records in 360 with these properties
- Video Codec: MPEG-H Part2/HEVC (H.265)(hvc1)
- Video Resolution: 2560x1280
- Frame rate: 29.970029
- Audio Codec: MPEG AAC Audio (mp4a)
- Stereo
- Sample rate: 48000 Hz
- Audio bit rate: 32

## Gear 360 ActionDirector Video Properties
The Gear 360 ActionDirector will stitch the Gear 360 videos with these properties
- Video Codec: H264 - MPEG-4 AVC (part10)(avc1)
- Video Resolution: 2560x1280
- Frame rate: 29.970029
- Audio Codec: MPEG AAC Audio (mp4a)
- Stereo
- Sample rate: 48000 Hz
- Audio bit rate: 32

## FFmpeg
[Download FFmpeg](https://ffmpeg.org/download.html) for your system.

### Merge Audio and Video Tracks
Use the following command to Merge together a video and audio track. The lengths of each track must be the same.
```
ffmpeg -i video.mp4 -i audio.m4a -acodec copy -vcodec copy output.mp4
```

### Demultiplex (separate) All Audio and Video Streams
Use the following command to find the stream maps
```
ffmpeg -i muxed.mp4
```
And then use the following command to demultiplex a video
```
ffmpeg.exe -i input.mp4 -c:v copy -map 0:0 output.m4v -c:a copy -map 0:1 output.m4a
```
