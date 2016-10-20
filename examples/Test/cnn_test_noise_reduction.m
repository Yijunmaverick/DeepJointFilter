% Flash/Non-flash

close all;

flash = 'carpet_00_flash.jpg';
nonflash = 'carpet_01_noflash.jpg';

%% target image
image  = imread(nonflash);
[h,w,s]=size(image);
image = double(image)./255;
  
%% guided image
Guide_image = imread(flash);
Guide_image = double(Guide_image)./255;
    
input = single(zeros(h,w,4));
input(:,:,2:4) = Guide_image;
    
%% load model    
load('NoiseReduction.mat')
net1.layers(1,1:10)=net.layers(1,1:10);
    
result=[];
for i=1:s
   input(:,:,1)=image(:,:,i);
   res=vl_simplenn(net1,input);
   im_h = gather(res(end).x);
   result(:,:,i)=im_h;
end
figure();imshow(image);
figure();imshow(result);
