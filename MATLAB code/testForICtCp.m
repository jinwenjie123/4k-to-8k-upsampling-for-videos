% Test ICtCp color space and get the png file after doing the interpolation

ii=imread('scene5.png');
% figure(1);
% imshow(ii);
%find the center and change other part of value to be gray
% P1 = 540 960
% P2 = 540 2880
% P3 = 1620 960
% P4 = 1620 2880



%change it to ICtCp
ImgOut = RGB2ICtCp(double(ii)/(2^16 - 1),false);
ImgOut = ImgOut*(2^16 - 1);
% sizeA = size(ImgOut);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation
% can be changed to nearest bilinear and bicubic
C = imresize(ImgOut,[4320,7680],'nearest');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output 
output1 = RGB2ICtCp(double(C)/(2^16 - 1),true);
output1 = output1*(2^16 - 1);
output1 = uint16(output1);
% 
finalOutput = output1(1080:3239,1920:5759,:);
%figure(2);
%imshow(finalOutput);
imwrite(finalOutput, 'Scene5-ICtCp-nearest.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation
% can be changed to nearest bilinear and bicubic
M = imresize(ImgOut,[4320,7680],'bilinear');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output 
output2 = RGB2ICtCp(double(M)/(2^16 - 1),true);
output2 = output2*(2^16 - 1);
output2 = uint16(output2);
% 
finalOutput2 = output2(1080:3239,1920:5759,:);
figure(3);
imshow(finalOutput2);
imwrite(finalOutput2, 'Scene5-ICtCp-bilinear.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation
% can be changed to nearest bilinear and bicubic
O = imresize(ImgOut,[4320,7680],'bicubic');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output 
output3 = RGB2ICtCp(double(O)/(2^16 - 1),true);
output3 = output3*(2^16 - 1);
output3 = uint16(output3);
% 
finalOutput3 = output3(1080:3239,1920:5759,:);
%figure(4);
%imshow(finalOutput3);
imwrite(finalOutput3, 'Scene5-ICtCp-bicubic.png');

ii(1:540,:,:) = 32768;
ii(1620:2160,:,:) = 32768;
ii(:,1:960,:) = 32768;
ii(:,2880:3840,:) = 32768;
%imshow(ii);
imwrite(ii, 'Scene5-test_original.png');

