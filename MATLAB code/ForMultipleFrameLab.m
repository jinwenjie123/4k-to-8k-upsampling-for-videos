% Test Lab color space and get the png file after doing the interpolation

for i=400:600
    ii=imread(sprintf('D:/4k-to-8k/video1-png/output_%d.png',i));


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
    
    %change it to LAB
    bb = RGB2XYZ(double(ii)/(2^16 - 1), 1, 'BT.2020');
    bb = bb*(2^16 - 1);
    ImgOut = ConvertXYZtoCIELab(bb, 0);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation 
    % can be changed to nearest bilinear and bicubic
    D = imresize(ImgOut,[4320,7680],'nearest');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % output 
    ImgOut2 = ConvertXYZtoCIELab(D, 1);
    cc = RGB2XYZ(double(ImgOut2)/(2^16 - 1), 0, 'BT.2020');
    output = cc*(2^16 - 1);
    output = uint16(output);
    
    finalOutput = output(1080:3239,1920:5759,:);
    %figure(2);
    %imshow(finalOutput);
    imwrite(finalOutput, sprintf('D:/4k-to-8k/video1-png/LabFrames/nearest/output_labnearest%d.png',i));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    D = imresize(ImgOut,[4320,7680],'bilinear');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    ImgOut2 = ConvertXYZtoCIELab(D, 1);
    xx = RGB2XYZ(double(ImgOut2)/(2^16 - 1), 0, 'BT.2020');
    output2 = xx*(2^16 - 1);
    output2 = uint16(output2);
    
    finalOutput2 = output2(1080:3239,1920:5759,:);
    %figure(3);
    %imshow(finalOutput2);
    imwrite(finalOutput2, sprintf('D:/4k-to-8k/video1-png/LabFrames/bilinear/output_labbilinear%d.png',i));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % interpolation
    % can be changed to nearest bilinear and bicubic
    E = imresize(ImgOut,[4320,7680],'bicubic');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % output 
    ImgOut3 = ConvertXYZtoCIELab(E, 1);
    ww = RGB2XYZ(double(ImgOut3)/(2^16 - 1), 0, 'BT.2020');
    output3 = ww*(2^16 - 1);
    output3 = uint16(output3);
    
    finalOutput3 = output3(1080:3239,1920:5759,:);
    %figure(4);
    %imshow(finalOutput3);
    imwrite(finalOutput3, sprintf('D:/4k-to-8k/video1-png/LabFrames/bicubic/output_labbicubic%d.png',i));

end