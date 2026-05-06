echo @off
echo "Remove audio track from mp4"
ffmpeg -i %1 -vf "fps=2,scale=iw:ih:flags=lanczos" -q:v 2 "%%04d.jpg"
GOTO :CommentBlockSkip

Saves a JPEG image of every 2 frames per second in a video

:CommentBlockSkip
pause
