# Samsung Gear 360

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
[Download FFmpeg](https://ffmpeg.org/download.html) for you system.

### Merge Audio and Video Tracks
Use the following command to Merge together a video and audio track. The lengths of each track must be the same.
```
ffmpeg -i video.mp4 -i audio.m4a -acodec copy -vcodec copy output.mp4
```

### Demultiplex (separate) All Audio and Video Streams
Use the following command to demultiplex a video
```
ffmpeg -i muxed.mp4
```
