function [Y, Cb, Cr] = rgb_to_ycbcr(R, G, B)
Y = double(min(max(0, floor(0.5 + (0.299*R + 0.587*G + 0.114*B))), 255));
Cb = double(min(max(0, floor(0.5 + (-0.299*R - 0.587*G + 0.886*B)/1.772 + 128)),255));
Cr = double(min(max(0, floor(0.5 + (0.701*R - 0.587*G - 0.114*B)/1.402 + 128)),255));
end