%vergelijkt de qualiteit van het origineel met high quality compression en
%low quality compression.
clear
close all

%high quality quantization tables:
hqL = [
     6  4  4  6  9 11 12 16;
     4  5  5  6  8 10 12 12;
     4  5  5  6 10 12 12 12;
     6  6  6 11 12 12 12 12;
     9  8 10 12 12 12 12 12;
    11 10 12 12 12 12 12 12;
    12 12 12 12 12 12 12 12;
    16 12 12 12 12 12 12 12;
    ];
hqC = [
      7  7 13 24 20 20 17 17;
      7 12 16 14 14 12 12 12;
     13 16 14 14 12 12 12 12;
     24 14 14 12 12 12 12 12;
     20 14 12 12 12 12 12 12;
     20 12 12 12 12 12 12 12;
     17 12 12 12 12 12 12 12;
     17 12 12 12 12 12 12 12
     ];
 
 %low quality quantization tables:
lqL = [
     20 16 25 39 50 46 62 68;
     16 18 23 38 38 53 65 68;
     25 23 31 38 53 65 68 68;
     39 38 38 53 65 68 68 68;
     50 38 53 65 68 68 68 68;
     46 53 65 68 68 68 68 68;
     62 65 66 68 68 68 68 68;
     68 68 68 68 68 68 68 68;
     ];
 lqC = [
     21 25 32 38 54 68 68 68;
     25 28 24 38 54 68 68 68;
     32 24 32 43 66 68 68 68;
     38 38 43 53 68 68 68 68;
     54 54 66 68 68 68 68 68;
     68 68 68 68 68 68 68 68;
     68 68 68 68 68 68 68 68;
     68 68 68 68 68 68 68 68
     ];
 
 f = double(imread('couple.png'));
 F = three_channels(@encode_channel, f);
 
 FQ_lq = three_channels(@quantize_channel, F, lqL, lqC);
 dFQ_lq = three_channels(@dequantize_channel, FQ_lq, lqL, lqC);
 df_lq = three_channels(@decode_channel, dFQ_lq);
 
 FQ_hq = three_channels(@quantize_channel, F, hqL, hqC);
 dFQ_hq = three_channels(@dequantize_channel, FQ_hq, hqL, hqC);
 df_hq = three_channels(@decode_channel, dFQ_hq);
 
 figure(1); imshow(uint8(f)); figure(1); %title('original image');
 
 figure(2); imshow(uint8(df_hq)); figure(2); %title('high quality jpeg');
 
 figure(3); imshow(uint8(df_lq)); figure(3); %title('low quality jpeg');
 
 figure(4); imagesc(max(abs(f-df_hq), [], 3)); figure(4);
 colorbar; %title('high quality deviation');
 
 figure(5); imagesc(max(abs(f-df_lq), [], 3)); figure(5); 
 colorbar; %title('low quality deviation');
 
 
 ri = 200:240; %zoom in op het gezicht
 rj = 280:320;
 
  figure(6); imshow(imresize(uint8(f(ri,rj,:)), 20, 'nearest')); figure(6); %title('original image');
 
 figure(7); imshow(imresize(uint8(df_hq(ri,rj,:)), 20, 'nearest')); figure(7); %title('high quality jpeg');
 
 figure(8); imshow(imresize(uint8(df_lq(ri,rj,:)), 20, 'nearest')); figure(8); %title('low quality jpeg');
 
 
 
 
 
 
 