%import the image
close all;
clc;
I = imread('old-doc.jpg');
BW = im2bw(I, 0.5);
figure;
imshow(BW);
recusiveYCut(I);

