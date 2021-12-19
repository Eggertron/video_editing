# Insta360 One X2

Insta360 One X2 Video Editing. Due to lack of free video editing softwares that support 5.7K produced by Insta360 One X2,
I've come up with a very basic way of merging videos and adding title screen clips.

## Tools

- [MP4 Joiner](https://www.mp4joiner.org/en/)
- [FFMPEG](https://ffmpeg.org/)
- [Insta360 STUDIO 2021](https://www.insta360.com/download/insta360-onex2)

## Video Specs

The Insta360 One X2 Generates 360 Videos with the max specs of

- 5760x2880
- 30 fps
- 200 Mbits (probably get away with 100)

and audo specs of

- MPEG AAC Audio (mp4a)
- Stereo
- 48000 Hz
- 32 bits

## Basic Template 360 Video

The basic template consists of 

1. Title Screen
2. 360 Video Content

### Title Screen

Creating a very basic Title Screen is as simple as generating a `png` file with a resolution of 5760x2880 and processing that `png` 
in `FFMPEG` to create and `mp4` output.

```
ffmpeg -framerate 25 -vcodec libx264 -pix_fmt yuv420p -i title_screen.png -t 10 out.mp4
```

### 360 Video Content

Use `Insta360 STUDIO` to trim and export your Insta360 video into `mp4` files. Some key pointers to trimming and exporting,

- Trim beginning and end of clips where the start/stop button is pressed on the Insta360 camera
- Trim long videos into smaller, meaningful clips
- Export at highest possible resolution and quality

### Merging Video Clips

Use `MP4Joiner` GUI to merge the `mp4` videos together. Make sure that all videos have the same resolution and framerates.
