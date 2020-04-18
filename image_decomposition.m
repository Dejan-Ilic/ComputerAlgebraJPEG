%deze code:
% 1) toont de originele foto
% 2) toont de R, G en B kanalen
% 3) toont de naive RGB -> YCbCr -> RGB afrondingsfout 
% 4) toont de Y, Cb en Cr kanalen

clear;
close all;

RGB = imread('couple.png'); %uit CSIQ
figure(1); imshow(RGB); figure(1); %title('original');

R = double(RGB(:,:,1));
G = double(RGB(:,:,2));
B = double(RGB(:,:,3));

%% toon de R,G,B kanalen
Z = ones(size(R))*0;


im = uint8(cat(3, R,Z,Z));
figure(2); imshow(im); figure(2); %title('Red channel');

im = uint8(cat(3, Z,G,Z));
figure(3); imshow(im); figure(3); %title('Green channel');

im = uint8(cat(3, Z,Z,B));
figure(4); imshow(im); figure(4); %title('Blue channel');

%zet om naar YCbCr kleuren
[Y,Cb,Cr] = rgb_to_ycbcr(R,G,B);

%% toon dat heen-en-weer gaan afrondingsfouten veroorzaakt
[R2,G2,B2] = ycbcr_to_rgb(Y,Cb,Cr);


figure(5); imagesc((R2 - R)); figure(5); %title("Red rounding error");
colorbar; 

figure(6); imagesc((G2 - G)); figure(6); %title("Green rounding error");
colorbar;

figure(7); imagesc((B2 - B)); figure(7); %title("Blue rounding error");
colorbar;

figure(11); imagesc(max(max(abs(R2 - R), abs(G2 - G)), abs(B2 - B))); colorbar;


%% toon de Y, Cb en Cr kanalen
Z = ones(size(R));
s_lum = 128;
s_chr = 128;

[R,G,B] = ycbcr_to_rgb(Y, s_chr*Z, s_chr*Z);
im = uint8(cat(3, R,G,B));
figure(8); imshow(im); figure(8); %title('Y - luminance');


[R,G,B] = ycbcr_to_rgb(s_lum*Z, Cb, s_chr*Z);
im = uint8(cat(3, R,G,B));
figure(9); imshow(im); figure(9); %title('Cb - chrominance blue-yellow');

[R,G,B] = ycbcr_to_rgb(s_lum*Z, s_chr*Z, Cr);
im = uint8(cat(3, R,G,B));
figure(10); imshow(im); figure(10); %title('Cr - chrominance red-green');

