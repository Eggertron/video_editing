# Insta360 One X2

Insta360 One X2 Video Editing. Due to lack of free video editing softwares that support 5.7K produced by Insta360 One X2,
I've come up with a very basic way of merging videos and adding title screen clips.

## Tools

- [MP4 Joiner](https://www.mp4joiner.org/en/)
- [FFMPEG](https://ffmpeg.org/)
- [Insta360 STUDIO 2021](https://www.insta360.com/download/insta360-onex2)
- [Blender](https://www.blender.org/)

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
in `FFMPEG` to create and `mp4` output. Place all your text as close to the center of the image.

```
ffmpeg -framerate 25 -vcodec libx264 -pix_fmt yuv420p -i title_screen.png -t 10 out.mp4
```

If you want to create a title screen that does not look warped across the verticle plane, you will want to use `Blender` to generate
and equirectangular title screen.

#### Blender

- Set your Renderer to Cycles
  - Go to `Rendering` tab
  - `Render Properties` in the `Properties` view
  - `Render Engine` and select `Cycles`
- use a black background
  - `World Properties`
  - drop down `Surface`
  - Select `color` from wheel
- Place text around the camera
  - press `Shift + A`
  - select `Text`
  - select your new text object
  - press `tab` to edit the text
- Change Camera Type to Panoramic
  - select your camera object
  - Go to `Object data properties`
  - select `Lens`
  - drop down `type`
  - select `Panoramic`
- Change Panorama Type to Equirectangular
  - drop down `Panorama Type`
  - select `Equirectangular`
- Go to Dimensions and change the resolution to 5760x2880.
  - Go to `Output Properties` and set your resolution.
- Render and export `png`

### 360 Video Content

Use `Insta360 STUDIO` to trim and export your Insta360 video into `mp4` files. Some key pointers to trimming and exporting,

- Trim beginning and end of clips where the start/stop button is pressed on the Insta360 camera
- Trim long videos into smaller, meaningful clips
- Export at highest possible resolution and quality

### Merging Video Clips

#### MP4Joiner

Use `MP4Joiner` GUI to merge the `mp4` videos together. Make sure that all videos have the same resolution and framerates.

#### FFMPEG (Transition Effects)

This will probably be the choice merging method especially if you want some scene transition effects. You can find some good examples [here](https://trac.ffmpeg.org/wiki/Xfade).
For a quick example, check out this dissolve transition

```
ffmpeg -i inputVideo1.mp4 -i inputVideo2.mp4 -filter_complex xfade=transition=dissolve:duration=2:offset=2 outputVideo.mp4
```
