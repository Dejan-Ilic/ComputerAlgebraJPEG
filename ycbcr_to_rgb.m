function [R, G, B] = ycbcr_to_rgb(Y, Cb, Cr)
    R = min(max(0, floor(0.5 + (Y + 1.402*(Cr - 128)) )), 255);
    G = min(max(0, floor(0.5 + (Y - (0.114*1.772*(Cb-128)+0.299*1.402*(Cr-128))/0.587))),255);
    B = min(max(0, floor(0.5 + (Y + 1.772*(Cb - 128)))), 255);
end