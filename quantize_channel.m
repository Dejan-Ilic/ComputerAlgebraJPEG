%quantized een color channel
function F = quantize_channel(F, q)
for blockx=0:(size(F,2)/8-1)
    for blocky=0:(size(F,1)/8 - 1)
        F_sub = F( (blocky*8+1):(blocky*8+8), (blockx*8+1):(blockx*8+8));
        F_sub = floor(0.5 + F_sub ./ q);
        F( (blocky*8+1):(blocky*8+8), (blockx*8+1):(blockx*8+8)) = F_sub;
    end
end
end