clc;
clear all;
close all;

% Load image (as gray)
imgName = 'image\Desert.jpg';
img = imread(imgName);
img = rgb2gray(img);
xres = size(img, 1);
yres = size(img, 2);
figure; imshow(img);

% Negative transformation
imgNegator = 255 * uint8(ones(xres, yres));
imgNegated = imgNegator - img;
figure; imshow(imgNegated);

% Logarithmic transformation
imgLogarithmic = uint8(255*log(1 + double(img)/255));
figure; imshow(imgLogarithmic);

% Power Law transformation
imgPowerLaw = uint8(255*((double(img)/255).^2));
figure; imshow(imgPowerLaw);

% Find histogram
imgHistogram = uint32(zeros(1, 256));
for i = 1 : xres
    for j = 1 : yres
        imgHistogram(1, img(i, j) + 1) = imgHistogram(1, img(i, j) + 1) + 1;
    end
end
figure; plot(imgHistogram);
title(['Histogram of ' imgName]);
