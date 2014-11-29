
clc;
clear all;
close all;

% Load Image
imgFile = 'cameraman.tif';
img = imread(imgFile);
yres = size(img, 1);
xres = size(img, 2);
figure;
imshow(img);
title('Original image');

% Probability distribution
img_Hist = imhist(img);
figure;
plot(img_Hist);
title('Histogram');

% Transformation function
clr_Start = 0;
clr_Step = 256 / (yres * xres);
img_Tf = zeros(256, 1);
for i = 1 : 255
    img_Tf(i) = clr_Start;
    clr_Start = clr_Start +  img_Hist(i) * clr_Step;
end

% Equalized image
imgEq = img;
for i = 1 : yres
    for j = 1 : xres
        clr_Org = img(i, j) + 1;
        imgEq(i, j) = uint8(floor(img_Tf(clr_Org)));
        img_Tf(clr_Org) = img_Tf(clr_Org) + clr_Step;
    end
end
figure;
imshow(imgEq);
imwrite(imgEq, 'PrfctHistEqu.png');
title('Equalized image');

% Find Histogram
imgEq_Hist = imhist(imgEq);
figure;
plot(imgEq_Hist);
title('Histogram');
