%dit scriptje visualiseert de verschillende frequenties die JPEG compressie
%gebruikt

clear;
close all;

c = 1016;
T = ones(8*8 + 7)*(-1);
F = zeros(8);

for i=1:8
    for j=1:8
        F(i,j) = c;
        df = (floor(decode_channel(F)+0.5));
        F(i,j) = 0;
        
        i1 = 1 + (i-1)*9;
        j1 = 1 + (j-1)*9;
        T(i1:(i1+7), j1:(j1+7)) = df;
    end
end

T = imresize(T, 12, 'nearest');

Tr = T;
Tr(Tr == -1) = 255;
T(T == -1) = 0;

figure; 
imshow(uint8(cat(3,Tr, T, T)));
set(gca,'XTick',[], 'YTick', [])

