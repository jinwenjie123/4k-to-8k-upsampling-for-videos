function img=RemoveSpecials(img)
%
%
%       img=RemoveSpecials(img)
%
%
%       This function removes specials: Inf and NaN
%
%       Input:
%           -img: an image which can contain float special values
%
%       Output:
%           -img: the image without float special values
%
indx= isnan(img);
img(indx)=1e-5;

indx=find(isinf(img));
img(indx) = 0;
img(indx) = max(max(max(img)));

end
