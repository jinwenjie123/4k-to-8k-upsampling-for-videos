%part1 YCBCR
ii=imread('scene5.png');

%find the center and change other part of value to be gray
% P1 = 540 960
% P2 = 540 2880
% P3 = 1620 960
% P4 = 1620 2880

% ii(1:540,:,:) = 32768;
% ii(1620:2160,:,:) = 32768;
% ii(:,1:960,:) = 32768;
% ii(:,2880:3840,:) = 32768;
% imshow(ii);
%imwrite(ii, 'test_original.png');

%change it to LAB
bb = RGB2XYZ(double(ii)/(2^16 - 1), 1, 'BT.2020');
bb = bb*(2^16 - 1);
ImgOut2 = ConvertXYZtoCIELab(bb, 0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation 
% can be changed to nearest bilinear and bicubic
D = imresize(ImgOut2,[4320,7680],'nearest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% output 
ImgOut3 = ConvertXYZtoCIELab(D, 1);
cc = RGB2XYZ(double(ImgOut3)/(2^16 - 1), 0, 'BT.2020');
output2 = cc*(2^16 - 1);
output2 = uint16(output2);

finalOutput = output2(1080:3239,1920:5759,:);
% figure(2);
% imshow(finalOutput);
imwrite(finalOutput, 'Scene5-Lab-nearest.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation 
% can be changed to nearest bilinear and bicubic
E = imresize(ImgOut2,[4320,7680],'bicubic');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% output 
ImgOut4 = ConvertXYZtoCIELab(E, 1);
dd = RGB2XYZ(double(ImgOut4)/(2^16 - 1), 0, 'BT.2020');
output3 = dd*(2^16 - 1);
output3 = uint16(output3);

finalOutput2 = output3(1080:3239,1920:5759,:);
% figure(3);
% imshow(finalOutput2);
imwrite(finalOutput2, 'Scene5-Lab-bicubic.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolation 
% can be changed to nearest bilinear and bicubic
F = imresize(ImgOut2,[4320,7680],'bilinear');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% output 
ImgOut5 = ConvertXYZtoCIELab(F, 1);
ww = RGB2XYZ(double(ImgOut5)/(2^16 - 1), 0, 'BT.2020');
output4 = ww*(2^16 - 1);
output4 = uint16(output4);

finalOutput3 = output4(1080:3239,1920:5759,:);
% figure(4);
% imshow(finalOutput3);
imwrite(finalOutput3, 'Scene5-Lab-bilinear.png');
