%reads in the unprocessed image, converts to grayscale, double
img = double(rgb2gray(imread('flower.bmp')));
[U,S,V]=svd(img);
figure('Name','Sigular value vs ranking');
bar(diag(S));
%=================================
% can direct use k for for loop
%================================
for k = [10,50,100]
imgRestore = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
figure;
imshow(uint8(imgRestore));
end