@echo off
ECHO "Convert video container to mp4 - Reencoding video stream to h.265"
ffmpeg -y -i %1 -preset veryslow -c:a copy -c:v libx265 %~n1_h256cq28cpu.mp4
GOTO :CommentBlockSkip

Drag n drop your video file on this script to compress it using CPU. The compression
is cleaner than GPU but it takes longer to compress.

:CommentBlockSkip
pause
