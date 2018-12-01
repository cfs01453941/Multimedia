back_ground_name = 'peacock.bmp';
fore_ground_name = 'kid2.bmp';

%back_ground_img = double(imread(back_ground_name))/255;
%fore_ground_img = double(imread(fore_ground_name))/255;


back_ground_img = im2double(imread(back_ground_name));
fore_ground_img = im2double(imread(fore_ground_name));

%{
back_ground_img = im2uint8(imread(back_ground_name));
fore_ground_img = im2uint8(imread(fore_ground_name));
%}

%%
img_size = size( back_ground_img );
combine_size = size( fore_ground_img );
new_img = back_ground_img;
%{
new_img( 1:combine_size(1), 1:combine_size(2)) = max( new_img( 1:combine_size(1), 1:combine_size(2) ), fore_ground_img);
%}

%%
start_point = [0, 50];

beta = 1-alpha;
new_img(1+start_point(1):combine_size(1)+start_point(1),1+start_point(2):combine_size(2)+start_point(2),:) = fore_ground_img.*repmat(alpha,[1,1,3]) + back_ground_img(1+start_point(1):combine_size(1)+start_point(1),1+start_point(2):combine_size(2)+start_point(2),:).*repmat(beta,[1,1,3]);

%%
%{
fore = F.*repmat(alpha,[1,1,3]);
imshow(fore);

for i=1:combine_size(1)
    for j=1:combine_size(2)
        if sum(fore(i,j,:)) > 0    % 前景不是黑色
            new_img(start_point(1)+i, start_point(2)+j, :) = fore(i,j,:);
        end
    end
end
%}

imshow(new_img);