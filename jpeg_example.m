%toon het hele JPEG proces op een grijze 8x8 afbeelding

close all
clear

%quantization table:
qt = [
    16 11 10 16 24  40  51  61;
    12 12 14 19 26  58  60  55;
    14 13 16 24 40  57  69  56;
    14 17 22 29 51  87  80  62;
    18 22 37 56 68  109 103 77;
    24 35 55 64 81  104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99;
    ];

%Test image from JPEG standard document for verification
f = uint8(... 
[139 144 149 153 155 155 155 155;
144 151 153 156 159 156 156 156;
150 155 160 163 158 156 156 156;
159 161 162 160 160 159 159 159;
159 160 161 162 162 155 155 155;
161 161 161 161 160 157 157 157;
162 162 161 163 162 157 157 157;
162 162 161 161 163 158 158 158]);

%encode
F = encode_channel(double(f));
disp(cell2mat(compose('%10.1f',F)))

%quantize (i.e. compress)
F_quantized = quantize_channel(F, qt)

%hier zou Huffman moeten gebeuren, maar dat is voor een andere cursus

%dequantize
dF = dequantize_channel(F_quantized, qt)

%decode
df = uint8(floor(decode_channel(dF)+0.5))
%opmerking: dit geeft een ander resultaat dan de originele JPEG paper,
%omdat ik op een andere manier afrond, een juistere naar mijn mening:
%-7.1/14 < -0.5, dus dat moet naar -1 worden afgerond naar mijn mening.
%In de JPEG paper wordt dit naar 0 afgerond. Moet ik ook mijn paper
%vermelden.

imagesc((double(f)-double(df))); colorbar;



