# [Deep Joint Image Filtering](https://sites.google.com/site/yijunlimaverick/deepjointfilter)

MatConvNet implementation of our ECCV16 [paper](https://drive.google.com/file/d/0B8_MZ8a8aoSeSVZRNVB1TkYtbFU/view) on joint image filtering. For academic use only. 

<img src='figs/teaser.png' width=800>

## Prerequisites

- Tested on Linux or Windows
- Matlab
- [MatConvNet](http://www.vlfeat.org/matconvnet) toolbox (Please compile first)

-- Training:

Download the training [data](https://drive.google.com/open?id=0B8_MZ8a8aoSeMm42TTJzc25MSGM) (for 8x depth upsampling) and put it under the examples/Train/TrainingData/ folder.

Run demo_train.m (examples/Train/demo_train.m)

-- Testing:

We provide our models and test codes for two tasks under the examples/Test/ folder, i.e., depth map upsampling and Flash/Non-flash image noise reduction.

We express gratitudes to [SRCNN](http://mmlab.ie.cuhk.edu.hk/projects/SRCNN.html) as we benefit a lot from both their paper and codes.
