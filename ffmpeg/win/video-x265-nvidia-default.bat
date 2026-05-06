echo @off
echo "Convert video container to mp4 - Reencoding video stream to h.265"
ffmpeg -i %1 -c:v hevc_nvenc -preset slow -c:a copy %~n1_h265cq23.mp4
GOTO :CommentBlockSkip

Key Parameters for High Quality
-c:v hevc_nvenc: Specifies the NVIDIA HEVC hardware encoder.
-preset p7: This is the slowest and highest quality preset available for NVENC (from p1 to p7). It offers the best quality-to-filesize ratio, though it will take longer to encode than faster presets (e.g., p4 which is the default).
-tune uhq: Enables the "Ultra High Quality" tuning profile, which dramatically improves quality compared to the default settings. This is a crucial setting for quality-conscious encodes.
-rc:v vbr -cq:v [value]: NVENC does not support the standard -crf (Constant Rate Factor) mode used by software encoders. Instead, use the Constant Quality (CQ) mode with Variable Bitrate (VBR) rate control.
The cq:v value ranges from 0 (lossless) to 51 (worst quality).
Values around 22-24 are generally recommended for visually near-lossless or very high-quality results, with a good trade-off in file size.
-pix_fmt yuv420p10le: This enables 10-bit color encoding, which provides better color accuracy, reduces banding artifacts, and generally results in a better compression ratio (smaller files for the same quality) compared to 8-bit. This is highly recommended even if your source is 8-bit.
-c:a copy: Copies the audio stream directly without re-encoding, saving time.
-bf 3 (Optional): Enabling B-frames can improve compression efficiency, though not all NVENC generations or profiles support it fully. Limiting B-frames to a small number (around 3) is a good practice. 
Unix & Linux Stack Exchange
Unix & Linux Stack Exchange
 +7
Important Considerations
CPU vs. GPU Quality: Software encoders like libx265 generally produce better quality video at the same bitrate than hardware encoders like hevc_nvenc. Hardware encoding is significantly faster but compromises on compression efficiency.
Bitrate (CBR/VBR): If you need to target a specific file size or bandwidth (e.g., for streaming), you can use options like -b:v 8M (average bitrate of 8 Mbps) along with -maxrate:v 10M to cap the peak bitrate. However, for maximum quality relative to the source, -cq:v (constant quality) is superior.
Driver/FFmpeg Version: Ensure you have an updated NVIDIA driver and a recent version of FFmpeg, as new features and quality improvements are added over time.

:CommentBlockSkip
pause
