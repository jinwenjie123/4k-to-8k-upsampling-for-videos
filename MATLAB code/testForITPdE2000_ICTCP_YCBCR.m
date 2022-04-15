% Here is the code for running and getting the results of dE ITP and dE2000
%ICTCP YCBCR
dE2000_avg_re = 0.0;
dETIP_avg_re = 0.0;


for i=1:9
img1 = imread(sprintf('D:/4k-to-8k/video1-png/Ictcp/bicubic/output_ictcpbicubic00%d.png',i));
img2 = imread(sprintf('D:/4k-to-8k/video1-png/YCbCrFrames/bicubic/output_ycbcrbicubic00%d.png', i));

img1 = double(img1) / (2^16 - 1);
img2 = double(img2) / (2^16 - 1);

%% DE2000 (in Lab space)
XYZ1 = RGB2XYZ(img1, 1, 'BT.2020');
XYZ2 = RGB2XYZ(img2, 1, 'BT.2020');

Lab1 = ConvertXYZtoCIELab(XYZ1, 0);
Lab2 = ConvertXYZtoCIELab(XYZ2, 0);

% imcolordiff requires MATLAB R2020b and Image Processing Toolbox
% ref: https://www.mathworks.com/help/images/ref/imcolordiff.html
dE2000 = imcolordiff(Lab1, Lab2, "Standard", "CIEDE2000");
dE2000_avg = mean(dE2000, 'all');

dE2000_avg_re = dE2000_avg_re + dE2000_avg;
%disp(dE2000_avg);

%% DEITP (in ICtCp space)
ICtCp1 = RGB2ICtCp(img1, 0);
ICtCp2 = RGB2ICtCp(img2, 0);

I1 = ICtCp1(:, :, 1);
T1 = 0.5 * ICtCp1(:, :, 2);
P1 = ICtCp1(:, :, 3);

I2 = ICtCp2(:, :, 1);
T2 = 0.5 * ICtCp2(:, :, 2);
P2 = ICtCp2(:, :, 3);

dETIP = 720 * sqrt((I1 - I2) .^ 2 + (T1 - T2) .^ 2 + (P1 - P2) .^ 2);
dETIP_avg = mean(dETIP, 'all');

dETIP_avg_re = dETIP_avg_re + dETIP_avg;

%disp(dETIP_avg);

end

for i=10:99
img1 = imread(sprintf('D:/4k-to-8k/video1-png/Ictcp/bicubic/output_ictcpbicubic0%d.png',i));
img2 = imread(sprintf('D:/4k-to-8k/video1-png/YCbCrFrames/bicubic/output_ycbcrbicubic0%d.png', i));

img1 = double(img1) / (2^16 - 1);
img2 = double(img2) / (2^16 - 1);

%% DE2000 (in Lab space)
XYZ1 = RGB2XYZ(img1, 1, 'BT.2020');
XYZ2 = RGB2XYZ(img2, 1, 'BT.2020');

Lab1 = ConvertXYZtoCIELab(XYZ1, 0);
Lab2 = ConvertXYZtoCIELab(XYZ2, 0);

% imcolordiff requires MATLAB R2020b and Image Processing Toolbox
% ref: https://www.mathworks.com/help/images/ref/imcolordiff.html
dE2000 = imcolordiff(Lab1, Lab2, "Standard", "CIEDE2000");
dE2000_avg = mean(dE2000, 'all');

dE2000_avg_re = dE2000_avg_re + dE2000_avg;
%disp(dE2000_avg);

%% DEITP (in ICtCp space)
ICtCp1 = RGB2ICtCp(img1, 0);
ICtCp2 = RGB2ICtCp(img2, 0);

I1 = ICtCp1(:, :, 1);
T1 = 0.5 * ICtCp1(:, :, 2);
P1 = ICtCp1(:, :, 3);

I2 = ICtCp2(:, :, 1);
T2 = 0.5 * ICtCp2(:, :, 2);
P2 = ICtCp2(:, :, 3);

dETIP = 720 * sqrt((I1 - I2) .^ 2 + (T1 - T2) .^ 2 + (P1 - P2) .^ 2);
dETIP_avg = mean(dETIP, 'all');

dETIP_avg_re = dETIP_avg_re + dETIP_avg;

%disp(dETIP_avg);

end
for i=100:400
img1 = imread(sprintf('D:/4k-to-8k/video1-png/Ictcp/bicubic/output_ictcpbicubic%d.png',i));
img2 = imread(sprintf('D:/4k-to-8k/video1-png/YCbCrFrames/bicubic/output_ycbcrbicubic%d.png', i));

img1 = double(img1) / (2^16 - 1);
img2 = double(img2) / (2^16 - 1);

%% DE2000 (in Lab space)
XYZ1 = RGB2XYZ(img1, 1, 'BT.2020');
XYZ2 = RGB2XYZ(img2, 1, 'BT.2020');

Lab1 = ConvertXYZtoCIELab(XYZ1, 0);
Lab2 = ConvertXYZtoCIELab(XYZ2, 0);

% imcolordiff requires MATLAB R2020b and Image Processing Toolbox
% ref: https://www.mathworks.com/help/images/ref/imcolordiff.html
dE2000 = imcolordiff(Lab1, Lab2, "Standard", "CIEDE2000");
dE2000_avg = mean(dE2000, 'all');

dE2000_avg_re = dE2000_avg_re + dE2000_avg;
%disp(dE2000_avg);

%% DEITP (in ICtCp space)
ICtCp1 = RGB2ICtCp(img1, 0);
ICtCp2 = RGB2ICtCp(img2, 0);

I1 = ICtCp1(:, :, 1);
T1 = 0.5 * ICtCp1(:, :, 2);
P1 = ICtCp1(:, :, 3);

I2 = ICtCp2(:, :, 1);
T2 = 0.5 * ICtCp2(:, :, 2);
P2 = ICtCp2(:, :, 3);

dETIP = 720 * sqrt((I1 - I2) .^ 2 + (T1 - T2) .^ 2 + (P1 - P2) .^ 2);
dETIP_avg = mean(dETIP, 'all');

dETIP_avg_re = dETIP_avg_re + dETIP_avg;

%disp(dETIP_avg);

end

dE2000_avg_re = dE2000_avg_re/400.0

dETIP_avg_re = dETIP_avg_re/400.0
