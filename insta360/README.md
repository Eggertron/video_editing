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

## Android App Info

The phone app seems contain more features and is a bit more advanced than the Windows app. Although this may
be a few extra steps additional for video processing, transferring the files to the phone for editing and
processing is better. Transfer the output video back to the computer for futher editing and publishing. There are
limitations to take into consideration,

- Max 360 video resolution 3840x1920
- Max FPS 30
- Max Bitrate 125

Insta360 app data path

```
\Internal storage\Android\data\com.arashivision.insta360akiko\files\Insta360OneR\galleryOriginal\ONEX2
```

The front/back camera videos are stored in `/Camera01/` and the corresponding LRV data is stored in `/LRV/`

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

##### Adjust Audio Levels only

This is an example of "removing" audio from a video without modifing the video stream. useful if the background contains 
copyrighted music.

```
ffmpeg.exe -i in.mp4 -vcodec copy -filter:a "volume=0.0" -strict unofficial out.mp4
```
 
This is an example of "removing" audio from specified seconds, 29 to 55 and 465 to 541.3 seconds respectively. Keep in mind that the comma needs to be escaped.

```
ffmpeg -i VID_20230218_170438_00_009.mp4 -vcodec copy -strict unofficial -af volume=0:enable='between(t\,29\,55)+between(t\,465\,541.3)' VID_20230218_170438_00_009_fixaudio.mp4
```
