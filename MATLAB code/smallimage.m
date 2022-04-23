ii=imread('small.png');
max(ii(:))
ImgOut = RGB2ICtCp(double(ii)/(255),false);
ImgOut = ImgOut*(255)    ;



C = imresize(ImgOut,[512,512],'nearest');

output1 = RGB2ICtCp(double(C)/(255),true);
output1 = output1*(255);
output1 = uint8(output1);



 imwrite(output1, 'small-nearest.png');
% 
% 
M = imresize(ImgOut,[512,512],'bilinear');



output2 = RGB2ICtCp(double(M)/(255),true);
output2 = output2*(255);
output2 = uint8(output2);
% 
finalOutput2 = output2;

imwrite(finalOutput2, 'small-bilinear.png');
M = imresize(ImgOut,[512,512],'bicubic');



output2 = RGB2ICtCp(double(M)/(255),true);
output2 = output2*(255);
output2 = uint8(output2);
% 
finalOutput2 = output2;

imwrite(finalOutput2, 'small-bicubic.png');