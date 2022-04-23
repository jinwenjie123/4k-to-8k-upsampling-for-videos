# 4k-to-8k-upsampling-for-videos

This project is aiming to upsample the 4k videos to 8k videos.
We tried the combination between 3 different color spaces and 3 different upsampling methods and tried to pick which pair is the best one.

# For our code, please open our folder"MATLAB code" with a happy face

For viewing the methods applied in colors spaces for small image:

For viewing the loop in different color spaces(YCbCr, Lab and ICtCp) and apply three interpolation methods(nearest neighbor interpolation, bilinear interpolation and bicubic interpolation) to generate output png files:  
ForMultipleFrameYCbCr.m  
ForMultipleFrameLab.m  
ForMultipleFrameICtCp.m

For viewing the objective testing:

![image](https://user-images.githubusercontent.com/91431648/163505628-96510d56-1599-41de-ba4c-cb064bd3ccae.png)

# Note: output files directory
For png files:  
original png files: D:/4k-to-8k/video1-png/output001.png  
output png files: D:/4k-to-8k/video1-png/YCbCrFrames/nearest/output_ycbcrnearest001.png  

For YUV files:  
original YUV files: D:\4k-to-8k\c06_Drama_standingup_4K60P_PQ_YUV420P10LE.yuv  
output YUV files: D:\4k-to-8k\yuv\video1ycbcrnearest.yuv  

Thank you!
