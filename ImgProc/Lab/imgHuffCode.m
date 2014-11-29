clc;
clear all;
close all;

% load image
img = imread('cameraman.tif');
yres = size(img, 1);
xres = size(img, 2);
pixels = xres * yres;
figure;
imshow(img);
title('Original image');

% find probability
prob = [(imhist(img)/pixels)'; 0:255]';
figure;
plot(prob(:,1));
title('Probability of values');

% generate map table
prob = sortrows(prob, 1);
