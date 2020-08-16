# VLC Media Player
[Download VLC](https://www.videolan.org/vlc/index.html) for your system.

## Download Videos from YouTube
In order to download anything from YouTube you'll need to have the latest lua
script in your system. Use this bash script for Linux,
```
#!/bin/bash

# Updates the youtube lua plugin directly from github
# user whereis vlc to find the folder

DEST=/usr/lib/x86_64-linux-gnu/vlc/lua/playlist
URL="https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua"

wget -O $DEST/youtube.lua $URL
```

or use this batch script for Windows,
```
```
After your lua script is updated you can download your target YouTube video
```
#!/bin/bash

BIN=/usr/bin/vlc
SAMPLERATE=44100
BITRATE=192
if [ -z $1 ]; then
    echo "Usage: $0 <input file> <outputfile> <start seconds> <end seconds>"
            exit 1
            fi
            if [ -z $2 ]; then
                    OUTFILE=output.mp3
                    else
                            OUTFILE=$2
                            fi
                            if [ ! -z $3 ]; then
                                    STARTTIME="--start-time=$3"
                                    else
                                            STARTTIME=""
                                            fi
                                            if [ ! -z $4 ]; then
                                                    STOPTIME="--stop-time=$4"
                                                    else
                                                            STOPTIME=""
                                                            fi
                                                            TRANSCODEMP3="#transcode{acodec=mp3,ab=$BITRATE,channels=2,samplerate=$SAMPLERATE}:std{access=file,mux=raw,dst=output.mp3}"
                                                            #TRANSCODEMP3="#transcode{acodec=mp3,ab=$BITRATE,channels=2,samplerate=$SAMPLERATE}:std{access=file,mux=raw,dst=$OUTFILE}"
                                                            PARAMS="-I dummy $STARTTIME $STOPTIME --no-sout-video --sout-audio --no-sout-rtp-sap --no-sout-standard-sap --ttl=1 --sout-keep --sout $TRANSCODEMP3 $1 vlc://quit"
                                                            echo "$BIN $PARAMS"
                                                            $BIN $PARAMS
                                                            mv output.mp3 "$OUTFILE"
```
### Download Audio Only from YouTube
Use this bash script for linux,
```
#!/bin/bash

VLC_LUA_PATH="/usr/lib/x86_64-linux-gnu/vlc/lua/playlist"
YOUTUBE_LUA_URL="https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua"
TRANSCODEMP3="#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100}:std{access=file,mux=raw,dst=output.mp3}"
PARAMS='-I dummy --no-sout-video --sout-audio --no-sout-rtp-sap --no-sout-standard-sap --ttl=1 --sout-keep --sout '$TRANSCODEMP3' '$1' vlc://quit'
PARAMSS='--sout "#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100}:std{access=file,mux=raw,dst=output.mp3}" '$1' vlc://quit'
echo $PARAMS
echo "must update youtube ula"
#sudo curl -o ${VLC_LUA_PATH}/youtube.lua $YOUTUBE_LUA_URL
vlc $PARAMS
```
or use this batch script for Windows,
