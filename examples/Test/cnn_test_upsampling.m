close all;

up_scale = 8;

% target image
im = imread('1025_big.png');
im = double(im)./255;
im = modcrop(im, up_scale);

% guided image
Guide_image = imread('1025_color.png');  
Guide_image = double(Guide_image)./255;
Guide_image = modcrop(Guide_image, up_scale);
[h,w,~]=size(Guide_image);
 
% generate low-res
im_l = im(up_scale:up_scale:end, up_scale:up_scale:end);

% first apply bicubic upsampling
im_l = imresize(im_l, [h w], 'bicubic');

input = single(zeros(h,w,4));
input(:,:,1) = im_l;
input(:,:,2:4) = Guide_image;

% filtering
load('Upsampling_8x.mat')
net1.layers(1,1:10)=net.layers(1,1:10);
res=vl_simplenn(net1, input);
output = gather(res(end).x);

% Residual-based filtering
load('Upsampling_res_8x.mat')
net1.layers(1,1:10)=net.layers(1,1:10);
res=vl_simplenn(net1, input);
output_res = gather(res(end).x) + input(7:end-6,7:end-6);

figure();
subplot(131); imshow(input(:,:,1)); title('Bicubic');
subplot(132); imshow(output); title('Filtering');
subplot(133); imshow(output_res); title('Residual-based filtering')

