function psnr = img_Psnr(img_Org, img_New)
R = 255;
sqrErr = (double(img_New) - double(img_Org)) .^ 2;
mse = sum(sum(sqrErr)) / (size(img_Org, 1) * size(img_Org, 2));
psnr = 10 * log10(R^2 / mse);
end

