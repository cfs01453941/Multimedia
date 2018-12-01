
%% parameters to change according to your requests

% foreground picture
fn_im='.\data\foreground\fore14.jpg';

%% configuration
addpath(genpath('./code'));

%% read image and mask
imdata=imread(fn_im);
mask = getTrimap_Mask(imdata);

%% compute alpha matte
[alpha]=learningBasedMatting(imdata,mask);

%% change background

% background picture
back_Picture_name = '.\data\background\back7.jpg';
back_Picture = imread(back_Picture_name);
sizeAlpha = size(alpha);
sizeBack = size(back_Picture);
newPicture = back_Picture;

% choose position
foreground = im2double(imdata);
alpha_3d = repmat(alpha,1,1,3);
fore = foreground.*alpha_3d;
imshow(fore);
[choosenJ,choosenI] = ginput(1);

imshow(back_Picture);
[startJ, startI] = ginput(1);
startI = round(startI-choosenI+1); 
startJ = round(startJ-choosenJ+1);
close;

% move
m=1;
for i=startI:startI+sizeAlpha(1)-1
	n=1;
	for j=startJ:startJ+sizeAlpha(2)-1
		if i<=sizeBack(1) && j<=sizeBack(2) && i>0 && j>0
			newPicture(i,j,:) = imdata(m,n,:)*alpha(m,n)+newPicture(i,j,:)*(1-alpha(m,n));
		end
		n = n+1;
	end
	m = m+1;
end


%% show results
figure,subplot(2,2,1); imshow(imdata); 
subplot(2,2,2),imshow(uint8(alpha*255));
subplot(2,2,3),imshow(back_Picture);
subplot(2,2,4),imshow(newPicture);

% imwrite(newPicture, 'result1.png');