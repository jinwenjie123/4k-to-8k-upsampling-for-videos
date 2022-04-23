% Test Lab color space and get the png file after doing the interpolation

for i=1:9
    ii=imread(sprintf('E:/4k-to-8k/video1-png/output_00%d.png',i));


%c{i}=imread(sprintf('img%d.jpg',i));0099999999999999999999999999999990

    % figure(1);
    % imshow(ii);
    %find the center and change other part of value to be gray
    % P1 = 540 960
    % P2 = 540 2880
    % P3 = 1620 960
    % P4 = 1620 2880
    
    ii(1:540,:,:) = 32768;
    ii(1620:2160,:,:) = 32768;
    ii(:,1:960,:) = 32768;
    ii(:,2880:3840,:) = 32768;
    %imshow(ii);
    %imwrite(ii, 'test_original_firework.png');
    %change it to ICtCp
    %change it to ICtCp

    ii=imread(sprintf('E:/4k-to-8k/video1-png/output_00%d.png',i))
    ImgOut = RGB2ICtCp(double(ii)/(2^16 - 1),false);
    ImgOut = ImgOut*(2^16 - 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    C = imresize(ImgOut,[4320,7680],'bicubic');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    output1 = RGB2ICtCp(double(C)/(2^16 - 1),true);
    output1 = output1*(2^16 - 1);
    output1 = uint16(output1);
    % 
    finalOutput = output1(1080:3239,1920:5759,:);
    
    imwrite(finalOutput, sprintf('E:/4k-to-8k/video1-png/Ictcp/bicubic/output_ictcpbicubic00%d.png',i));
    


%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %change it to YCBCR
%     ImgOut = RGB2YCbCr(double(ii)/(2^16 - 1), 1, 'BT.2020', true);
%     ImgOut = ImgOut*(2^16 - 1);
%     % sizeA = size(ImgOut);
%     D = imresize(ImgOut,[4320,7680],'nearest');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % output 
%     output2 = RGB2YCbCr(double(D)/(2^16 - 1), 0, 'BT.2020', true);
%     output2 = output2*(2^16 - 1);
%     output2 = uint16(output2);
%     
%     finalOutput2 = output2(1080:3239,1920:5759,:);
%     %figure(3);
%     %imshow(finalOutput2);
%     imwrite(finalOutput2, sprintf('E:/4k-to-8k/video2-png/YCbCrFrames/nearest/output_ycbcrnearest0%d.png',i));
    
end