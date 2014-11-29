function huff_Save(filename, img)

% save basic info
yres = size(img, 1);
xres = size(img, 2);
pixels = yres * xres;
file = fopen(filename, 'w');
fwrite(file, yres, 'uint16');
fwrite(file, xres, 'uint16');

% save probability order
prob = [(0:255)', imhist(img)];
prob = sortrows(prob, 2);
prob = prob(256:-1:1, :);
fwrite(file, prob(:,1), 'uint8');
prob(1:256,2) = 0:255;
prob = sortrows(prob, 1);

% build mapping table
map = cell(256, 1);
for i = 1 : 256
%     val = [ones(prob(i,2),1); 0];
%     map{i} = val(1:min(length(val), 255));
    val = prob(i,2);
    grp = floor(log2(max(val, 1)));
    elem = uint8(abs(val - (2 ^ grp)));
    map{i} = [decimalToBinaryVector(grp, 3) decimalToBinaryVector(elem, max(grp, 1))];
end

% generate file data and write
pBin = 1;
pData = 1;
bin = uint8(zeros(8192+256, 1));
data = uint8(zeros(pixels, 1));
src = reshape(img, [], 1);
for i = 1 : pixels
    val = map{1+src(i)};
    bin(pBin:(pBin+length(val)-1)) = val;
    pBin = pBin + length(val);
    if(pBin > 8192)
        val = type_ToBytes(bin, 1, 8192);
        data(pData:(pData+length(val)-1)) = val;
        pData = pData + length(val);
        bin(1:256) = bin(8193:end);
        pBin = pBin - 8192;
    end
end
val = zeros(8-mod(pBin-1,8), 1);
bin(pBin:(pBin+length(val)-1)) = val;
pBin = pBin + length(val);
val = type_ToBytes(bin, 1, pBin-1);
data(pData:(pData+length(val)-1)) = val;
pData = pData + length(val);
fwrite(file, data(1:(pData-1)), 'uint8');
fclose(file);
end