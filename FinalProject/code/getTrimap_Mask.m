function [ mask ] = getTrimap_Mask( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

BW_big = roipoly(A);
BW_small = roipoly(A);

Big = double(BW_big);
Small = double(BW_small);

Trimap = (Big + Small)/2;
Trimap = im2uint8(Trimap);

imshow(Trimap);

mask=zeros(size(Trimap,1),size(Trimap,2));
fore=(Trimap==255);
back=(Trimap==0);

mask(fore)=1;
mask(back)=-1;


end

