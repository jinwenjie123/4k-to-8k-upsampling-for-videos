# 4k-to-8k-upsampling-for-videos

This project is aiming to upsample the 4k videos to 8k videos.
We tried the combination between 3 different color spaces and 3 different upsampling methods and tried to pick which pair is the best one.

# For our code, please open our folder"MATLAB code" with a happy face


<b>Project name</b>: 4K TO 8K HDR VIDEO UPSAMPLING TO ENSURE THE BEST QOE

**Names of the team members**: Mankirat Singh, Minghang Li, Wenjie Jin

**Software requirement**: To run the code you need to install: MATLAB, ffmpeg and gpac
MATLAB code is present in 'MATLAB code' folder
ffmpeg code is present in 'commands about converting' folder

**Operating System Used**: Windows 10

**Instructions to generate outputs**:

To produce upsampled frame for small image, use the function:  
smallimage.m   

**To produce multiple upsampled frames in different color spaces(YCbCr, Lab and ICtCp) and three interpolation methods(nearest neighbor interpolation, bilinear interpolation and bicubic interpolation), use the following functions:**
ForMultipleFrameYCbCr.m  
ForMultipleFrameLab.m  
ForMultipleFrameICtCp.m

**To produce single upsampled frame in different color spaces(YCbCr, Lab and ICtCp) and three interpolation methods(nearest neighbor interpolation, bilinear interpolation and bicubic interpolation), use the following functions:**
testForICtCp.m
testForYCbCr.m
testForLab.m

**To create yuv video file**, use ffmpeg command from 'png to video.txt'

**To stitch yuv video files**, use ffmpeg command from 'combine 4 yuv files together.txt'

**To generate an mp4 video from yuv**, use ffmpeg command from 'yuv to mp4.txt'

**A list of known bugs/issues**: Be careful with the path while running ffmpeg.

**Future work**: Create and compare videos from all different combinations of color spaces and upsampling methods. Currently we compared Bicubic method in all color spaces, and all upsampling methods in Lab color space.

**For viewing the objective testing**:

![image](https://user-images.githubusercontent.com/91431648/163505628-96510d56-1599-41de-ba4c-cb064bd3ccae.png)

# Note: output files directory
**For png files: ** 
original png files: D:/4k-to-8k/video1-png/output001.png  
output png files: D:/4k-to-8k/video1-png/YCbCrFrames/nearest/output_ycbcrnearest001.png  

**For YUV files:**  
original YUV files: D:\4k-to-8k\c06_Drama_standingup_4K60P_PQ_YUV420P10LE.yuv  
output YUV files: D:\4k-to-8k\yuv\video1ycbcrnearest.yuv  

Thank you!
