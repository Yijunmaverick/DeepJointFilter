% donwload NYU v2 dataset from http://cs.nyu.edu/~silberman/datasets/nyu_depth_v2.html
load('nyu_depth_v2_labeled.mat');

scale = 8;
size_input = 33;
size_label = 21;
stride = 40;

data = zeros(size_input, size_input, 4, 1);
label = zeros(size_label, size_label, 1, 1);
padding = abs(size_input - size_label)/2;
count = 0;

for i=1:1000
    disp(i);
     
    Guide_image = images(:,:,:,i);
    Guide_image = double(Guide_image)./255;
    Guide_image = modcrop(Guide_image, scale);
     
    dimage = depths(:,:,i);
    dimage = (dimage-min(dimage(:))) ./ (max(dimage(:))-min(dimage(:)));
    im_label = modcrop(dimage, scale);
       
    [hei,wid] = size(im_label);
    
     StartPoint = scale;
     LowResDepth = im_label(StartPoint:scale:end,StartPoint:scale:end);     
     im_input = double(imresize(LowResDepth,[hei,wid], 'bicubic'));                   

     for x = 1 : stride : hei-size_input+1
         for y = 1 :stride : wid-size_input+1

             subim_input = im_input(x : x+size_input-1, y : y+size_input-1);
             subim_guidance = Guide_image(x : x+size_input-1, y : y+size_input-1, :);
             subim_label = im_label(x+padding : x+padding+size_label-1, y+padding : y+padding+size_label-1);

             count=count+1;
             data(:, :, 1, count) = subim_input;
             data(:, :, 2:4, count) = subim_guidance; 
             label(:, :, 1, count) = subim_label;
         end
     end
 end


order = randperm(count);
data = data(:, :, :, order);
label = label(:, :, 1, order); 

images=struct();
images.data=data;
images.labels=label;
set=ones(1,count);
set(1,160001:count)=3;
images.set=set;
save loaddb_depth_8_nyu_1000_NNdownsample images
