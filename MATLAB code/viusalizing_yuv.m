clear all
close all

%addpath('')% 

a=imread('1hdr.png');
a=double(a);
figure; imshow(a/(2^16-1))
       
        
        
a=a/(2^16-1);
ImgOut = RGB2YCbCr(a, true, 'BT.2020', true);

ImgOutRGB = RGB2YCbCr(ImgOut , false, 'BT.2020', true);
figure(2);imshow(ImgOutRGB)


ImgOut3=ImgOut*(2^16-1);
ImgOut3(:,:,2)=ImgOut3(:,:,2)+2^15;
ImgOut3(:,:,3)=ImgOut3(:,:,3)+2^15;
ImgOutRGB = RGB2YCbCr(ImgOut3/(2^16-1) , false, 'BT.2020', true);
figure(3);imshow(ImgOutRGB)



ImgOut1=(ImgOut*(2^16-1));


numfrm=1;
Y = cell(1,numfrm);
U = cell(1,numfrm);
V = cell(1,numfrm);

y=ImgOut1(:,:,1)';
u=ImgOut1(:,:,2)';
v=ImgOut1(:,:,3)';


Y{1}=(y(:));
u=ImgOut1(:,:,2)'+2^15;
U{1}=(u(:));
v=ImgOut1(:,:,3)'+2^15;
V{1}=(v(:));


numfrm=1;
fid=fopen('0.yuv','w');

for i=1:numfrm
    print(i)
    Yd = Y{i};
    fwrite(fid,Yd,'uint16');    
    UVd = U{i};  
    fwrite(fid,UVd,'uint16');
    UVd = V{i}; 
    fwrite(fid,UVd,'uint16');   
end;
fclose(fid);

