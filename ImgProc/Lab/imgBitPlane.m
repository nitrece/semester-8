clc;
clear all;
close all;

img = imread('cameraman.tif');
yres = size(img, 1);
xres = size(img, 2);
pixels = xres * yres;
figure;
imshow(img);

imgBit = uint8(zeros(yres, xres, 8));
for i = 1 : 8
    imgBit(:,:,i) = bitget(img, i);
    figure;
    imshow(imgBit(:,:,i),[]);
end
