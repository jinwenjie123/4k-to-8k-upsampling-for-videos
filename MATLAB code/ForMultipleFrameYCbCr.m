% Test YCbCr color space and get the png file after doing the interpolation

for i=400:600
    ii=imread(sprintf('D:/4k-to-8k/video2-png/output_%d.png',i));


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
    
    %change it to YCBCR
    ImgOut = RGB2YCbCr(double(ii)/(2^16 - 1), 1, 'BT.2020', true);
    ImgOut = ImgOut*(2^16 - 1);
    % sizeA = size(ImgOut);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    C = imresize(ImgOut,[4320,7680],'bilinear');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    output1 = RGB2YCbCr(double(C)/(2^16 - 1), 0, 'BT.2020', true);
    output1 = output1*(2^16 - 1);
    output1 = uint16(output1);
    
    finalOutput = output1(1080:3239,1920:5759,:);
    %figure(2);
    %imshow(finalOutput);
    imwrite(finalOutput, sprintf('D:/4k-to-8k/video2-png/YCbCrFrames/bilinear/output_ycbcrbilinear%d.png',i));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    D = imresize(ImgOut,[4320,7680],'nearest');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    output2 = RGB2YCbCr(double(D)/(2^16 - 1), 0, 'BT.2020', true);
    output2 = output2*(2^16 - 1);
    output2 = uint16(output2);
    
    finalOutput2 = output2(1080:3239,1920:5759,:);
    %figure(3);
    %imshow(finalOutput2);
    imwrite(finalOutput2, sprintf('D:/4k-to-8k/video2-png/YCbCrFrames/nearest/output_ycbcrnearest0%d.png',i));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    E = imresize(ImgOut,[4320,7680],'bicubic');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    output3 = RGB2YCbCr(double(E)/(2^16 - 1), 0, 'BT.2020', true);
    output3 = output3*(2^16 - 1);
    output3 = uint16(output3);
    
    finalOutput3 = output3(1080:3239,1920:5759,:);
    %figure(4);
    %imshow(finalOutput3);
    imwrite(finalOutput3, sprintf('D:/4k-to-8k/video2-png/YCbCrFrames/bicubic/output_ycbcrbicubic0%d.png',i));
    %imwrite(finalOutput3, 'YCbCr-bicubic.png')
end