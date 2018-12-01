function C=getC(mask,c)
% C=getC(mask,c) get the regularization matrix as shown in equation (6) in
% our iccv09 paper
% 
% Input arguments:
% mask:   MxN matrix specifying scribbles, with 1 foreground, -1 background
%         and 0 otherwise
% c:      parameter adjusting the regularization term's importance
% 
% Output argument:
% C:     (MxN)X(MxN) sparse matrix
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

disp('Computing regularization matrix ... ...')
scribble_mask=abs(mask)~=0;
numPix=size(mask,1)*size(mask,2);
C=c*spdiags(double(scribble_mask(:)),0,numPix,numPix);

