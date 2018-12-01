function [alpha]=learningBasedMatting(imdata,mask)
% [alpha]=learningBasedMatting(im,mask) computes matte given image and
% scribble mask
% 
% Input arguments:
% imdata:   MxNxd image data matrix. Image size is MxN, and the number of features is d. Value
%           range is within [0 255]
% mask:     MxN matrix specifying scribbles, with 1 foreground, -1 background
%           and 0 otherwise
% 
% Output arguments:
% alpha:    (MxN) matrix of alpha solution
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% get laplacian matrix
winsz=3;
c=800;
lambda=0.0000001;

L=getLap(imdata,winsz,mask,lambda);

% get regularization matrix
C=getC(mask,c);

% get already known values
alpha_star=getAlpha_star(mask);

% solve alpha
alpha=solveQurdOpt(L,C,alpha_star);
