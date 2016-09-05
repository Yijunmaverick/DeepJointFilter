close all;clc;
if ~exist('imdb')
    imdb = load('./TrainingData/loaddb_depth_nyu_1000.mat') ;

    imdb.images.data = single(imdb.images.data(:,:,:,1:192000));
    imdb.images.labels = single(imdb.images.labels(:,:,:,1:192000));
end
[net, info] = GoTraining(imdb);
