function data = type_ToBytes(bin, start, stop)
pData = 1;
len = stop-start+1;
dLen = floor(len/8);
data = uint8(zeros(dLen,1));
mult = uint8([1 2 4 8 16 32 64 128]');
for i = start : 8 : stop
    data(pData) = uint8(sum(uint8(bin(i:i+7)).*mult));
    pData = pData + 1;
end
end