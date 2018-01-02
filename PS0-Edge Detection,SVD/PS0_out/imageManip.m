%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)
dark = double(rgb2gray(imread('u2dark.png')));

%%%%%% Your part (a) code here: calculate statistics
%=============================================
% can use dark(:) to list all the value for(sum,mean,max) operation
% ===========================================
meanValue = mean(dark(:));

%%%%%% Your part (b) code here: apply offset and scaling
fixedimg = [];
minVal= min(dark(:));
maxVal= max(dark(:));
%displays the image
scale = 255/(maxVal-minVal);
fixedimg = (dark-minVal)*scale;
figure,imshow(uint8(fixedimg));

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = [];
%=============================================
% can use uint8 to force pixel value of image range from (0~255)
% ===========================================
contrasted = uint8(2*(fixedimg-128)+128);

figure,imshow(contrasted);