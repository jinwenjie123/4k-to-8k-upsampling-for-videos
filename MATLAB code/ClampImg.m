function img = ClampImg(img, a, b)
%
%
%       img = ClampImg(img, a, b)
%
%
%       Image is clamped if its values are over [a,b]
%
%       Input:
%           -img: the input img to be clamped
%           -a: the lower bound
%           -b: the upper bound
%           
%       Output:
%           -img: output clamped image
%

img(img < a) = a;
img(img > b) = b;

end