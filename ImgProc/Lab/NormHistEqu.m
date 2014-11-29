% Image Processing: Experiment 2
% Name: Subhajit Sahu
% Roll: 110EC0181
% Date: 27.01.2014

clc;
clear all;
close all;

% Load Image
imgFile = 'cameraman.tif';
img = imread(imgFile);
xres = size(img, 1);
yres = size(img, 2);
figure;
imshow(img);
title('Original image');

% Find Histogram
imgHist = zeros(1, 256);
for i = 1 : xres
    for j = 1 : yres
        pix = 1 + img(i, j);
        imgHist(1, pix) = imgHist(1, pix) + 1;
    end
end
imgHist = imgHist / (xres * yres);
figure;
plot(imgHist);
title('Histogram');

% Histogram equalization
imgCum = imgHist;
for i = 2 : 256
    imgCum(1, i) = imgCum(1, i-1) + imgCum(1, i);
end
figure;
plot(imgCum);
title('Cumulative probability');
imgEq = zeros(xres, yres);
for i = 1 : xres
    for j = 1 : yres
        pix = img(i, j);
        imgEq(i, j) = imgCum(1, 1 + pix);
    end
end
figure;
imshow(imgEq);
title('Equalized image');
imwrite(imgEq, 'HistEqu.png');

figure;
plot(imhist(imgEq));
