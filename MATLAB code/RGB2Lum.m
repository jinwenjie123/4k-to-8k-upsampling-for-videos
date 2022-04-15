function Lum = RGB2Lum(ImgIn, Gamut, MPEG)
%RGB2Lum - compute the luminance of an HDR image.
%
% Syntax: Lum = RGB2Lum(ImgIn, Gamut, MPEG)
%
% Inputs:
%    -ImgIn: input image
%    -Gamut: gamut of the RGB values
%    -MPEG: use the MPEG approximate matrix
%
% Outputs:
%    -Lum: output luma or luminance
%
% Example:
%    -Lum = RGB2Lum(ImgIn, 'P3D65', true)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: 
% References:
%    -International Telecommunication Union, “Parameter Values for the HDTV
%    Standard for Production and International Programme Exchange,” in
%    Recommendation ITU-R BT.709, 1998.
%    -International Telecommunication Union, “Parameter values for
%    ultra-high definition television systems for production and
%    international programme exchange,” in Recommendation ITU-R BT.2020,
%    2012.
%    -Society of Motion Picture & Television Engineers, RP 431-2:2011 :
%    D-Cinema Quality — Reference Projector and Environment, vol. 10607,
%    no. 914. The Society of Motion Picture and Television Engineers, 2011.
%    -A. Luthra, E. Francois, and W. Husak, “Call for Evidence (CfE) for
%    HDR and WCG Video Coding,” in ISO/IEC JTC1/SC29/WG11 MPEG2014/N15083,
%    2015.

% Author: Ronan Boitard
% University of British Columbia, Vancouver, Canada
% email: rboitard.w@gmail.com
% Website: http://http://www.ece.ubc.ca/~rboitard/
% Created: 15-Mar-2012; Last revision: 22-Oct-2015

%---------------------------- BEGIN CODE ----------------------------------

if(~exist('Gamut','var'))
    Gamut = 'BT.709';
end
if(~exist('MPEG','var'))
    MPEG = false;
end
if MPEG
    Gamut = [Gamut 'MPEG'];
end

if strcmp(Gamut, 'BT.709')
    % Taken from ITU. (1998). RECOMMENDATION ITU-R BT.709-3.
    % Derivation of luminance signal
    Lum = 0.2126 * ImgIn(:,:,1) +...
        0.7152 * ImgIn(:,:,2) +...
        0.0722 * ImgIn(:,:,3) ;
elseif strcmp(Gamut, 'BT.2020')
    % Taken from ITU. (2012). Recommendation ITU-R BT.2020.
    % Derivation of non-constant luminance signal
    Lum = 0.2627 * ImgIn(:,:,1) +...
          0.6779 * ImgIn(:,:,2) +...
          0.0593 * ImgIn(:,:,3) ;
elseif strcmp(Gamut, 'BT.2020MPEG')
    % Taken from ITU. (2012). Recommendation ITU-R BT.2020.
    % Derivation of non-constant luminance signal
    Lum = 0.262700 * ImgIn(:,:,1) +...
          0.677998 * ImgIn(:,:,2) +...
          0.059302 * ImgIn(:,:,3) ;      
elseif strcmp(Gamut, 'P3D65')
    % Taken from CfE section B.1.5.9.4
    % A. Luthra, E. Francois, and W. Husak, “Call for Evidence (CfE) for
    % HDR and WCG Video Coding,” in ISO/IEC JTC1/SC29/WG11 MPEG2014/N15083,
    % 2015. 
    Lum = 0.228975 * ImgIn(:,:,1) +...
        0.691739 * ImgIn(:,:,2) +...
        0.079287 * ImgIn(:,:,3) ;       
elseif strcmp(Gamut, 'P3')
    % Taken from Society of Motion Picture & Television Engineers, RP
    % 431-2:2011 : D-Cinema Quality — Reference Projector and Environment,
    % vol. 10607, no. 914. The Society of Motion Picture and Television
    % Engineers, 2011.
    Lum = 0.2094916779 * ImgIn(:,:,1) +...
        0.7215952542 * ImgIn(:,:,2) +...
        0.0689130679 * ImgIn(:,:,3) ;    
end
end
%--------------------------- END OF CODE ----------------------------------
% Header generated using two templates:
% - 4908-m-file-header-template
% - 27865-creating-function-files-with-a-header-template