function ImgOut = RGB2XYZ(ImgIn, Encode, Gamut, M_Custom)
%RGB2XYZ - encode RGB values into XYZ values or decode XYZ into RGB.
%
% Syntax:  ImgOut = RGB2XYZ(ImgIn, Encode, Gamut, M_Custom)
%
% Inputs:
%    -ImgIn: input image, if Encode = 1 : XYZ image, otherwise RGB
%    -Encode: Encoding or decoding the values
%    -Gamut: gamut of the RGB values
%    -M_Custom: provide a custom conversion matrix
%
% Outputs:
%    -ImgOut: output image, if Encode = 1 : RGB image, otherwise XYZ
%
% Example:
%    ImgOut = RGB2XYZ(ImgIn, true, 'P3D65')
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: 

% Author: Ronan Boitard
% University of British Columbia, Vancouver, Canada
% email: rboitard.w@gmail.com
% Website: http://http://www.ece.ubc.ca/~rboitard/
% Created: 15-Mar-2012; Last revision: 22-Oct-2015

%---------------------------- BEGIN CODE ----------------------------------
if (~exist('Encode', 'var'))
    Encode = 1;
end
if (~exist('Gamut', 'var'))
    Gamut = 'BT.709';
end
if (strcmp(Gamut, 'Adobe'))
    M_CAT = [
        0.576700  0.297361  0.0270328
        0.185556  0.627355  0.0706879
        0.188212  0.0752847 0.991248];
    if ~Encode
        M_CAT = inv(M_CAT);
    end
    
elseif (strcmp(Gamut, 'NTSC'))
    M_CAT = [
        0.6068909  0.1735011  0.2003480
        0.2989164  0.5865990  0.1144845
        -0.0000000  0.0660957  1.1162243];
    if ~Encode
        M_CAT = inv(M_CAT);
    end
elseif (strcmp(Gamut, 'BT.709'))
    % Taken from ITU. (1998). RECOMMENDATION ITU-R BT.709-3.
    % Derivation of luminance signal    
    M_CAT = [
        0.412391 0.357584 0.180481;
        0.212639 0.715169 0.072192;
        0.019331 0.119195 0.950532];
    if ~Encode
        M_CAT = inv(M_CAT);
    end
elseif (strcmp(Gamut, 'BT.2020'))
    % Taken from ITU. (2012). Recommendation ITU-R BT.2020.
    % Derivation of non-constant luminance signal
    M_CAT = [
        0.636958 0.144617 0.168881;
        0.262700 0.677998 0.059302;
        0.000000 0.028073 1.060985];
    if ~Encode
        M_CAT = inv(M_CAT);
    end
elseif (strcmp(Gamut, 'P3D65'))
    % Taken from CfE section B.1.5.9.4
    % A. Luthra, E. Francois, and W. Husak, “Call for Evidence (CfE) for
    % HDR and WCG Video Coding,” in ISO/IEC JTC1/SC29/WG11 MPEG2014/N15083,
    % 2015.
    M_CAT = [
        0.486571 0.265668 0.198217;
        0.228975 0.691739 0.079287;
        0.000000 0.045113 1.043944];
    if ~Encode
        M_CAT = inv(M_CAT);
    end
elseif (strcmp(Gamut, 'P3'))
    % Taken from Society of Motion Picture & Television Engineers, RP
    % 431-2:2011 : D-Cinema Quality — Reference Projector and Environment,
    % vol. 10607, no. 914. The Society of Motion Picture and Television
    % Engineers, 2011.
    M_CAT = [
        0.4451698156 0.2771344092 0.1722826698;
        0.2094916779 0.7215952542 0.0689130679;
        0.0000000000 0.0470605601 0.9073553944];
    if ~Encode
        M_CAT = inv(M_CAT);
    end    
elseif (strcmp(Gamut, 'Custom'))
    M_CAT = M_Custom;
    if ~Encode
        M_CAT = inv(M_CAT);
    end
else
    a = [
        3.240479 -1.537150 -0.498535
        -0.969256 1.875992 0.041556
        0.055648 -0.204043 1.057311];
    M_CAT = inv(a);
    if ~Encode
        M_CAT = inv(M_CAT);
    end
end

if size(ImgIn, 3) == 1
    % Convert XYZ to xyY
    ImgOut = M_CAT * ImgIn';
else
    ImgOut = reshape((M_CAT * reshape(ImgIn,size(ImgIn,1)*size(ImgIn,2),size(ImgIn,3))')', size(ImgIn,1),size(ImgIn,2),size(ImgIn,3));
end
end
%--------------------------- END OF CODE ----------------------------------
% Header generated using two templates:
% - 4908-m-file-header-template
% - 27865-creating-function-files-with-a-header-template