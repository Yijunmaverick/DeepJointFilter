% Inverse halftone

target = 'tintin_v21_p29_panel07_input.png';

%% target image
image  = imread(target);
[h,w,~] = size(image);
image = double(image)./255;
  
%% guided image
Guide_image = image;
    
input = single(zeros(h,w,4));
input(:,:,2:4) = Guide_image;
    
%% load model    
load('NoiseReduction_res.mat')
net1.layers(1,1:10)=net.layers(1,1:10);
    
result=[];
for i=1:s
   input(:,:,1)=image(:,:,i);
   res=vl_simplenn(net1,input);
   im_h = gather(res(end).x);
   result(:,:,i)=im_h+input(7:end-6,7:end-6,1);
end
figure();imshow(image);
figure();imshow(result);
imwrite(result,'tintin_v21_p29_panel07_0.png');
