function alpha_star=getAlpha_star(mask)
% alpha_star=getAlpha_star(mask) get the pri-known alpha values according
% to the mask. See equation (6) in our iccv2009 paper.
% 
% Input arguments:
% mask:   MxN matrix specifying scribbles, with 1 foreground, -1 background
%         and 0 otherwise
% 
% Output arguments:
% alpha_star:     (MxN) matrix showing the prio-known value of alpha.
%                 The value is 1 for foreground scribble pixels, and 0
%                 otherwise
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

disp('Computing preknown alpha values ... ...')

alpha_star=zeros(size(mask,1),size(mask,2));
alpha_star(mask>0)=1;
alpha_star(mask<0)=-1;