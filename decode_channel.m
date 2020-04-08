function f = decode_channel(F)


f = zeros(size(F));
C = @(u) sqrt(1/2).^(u==0);

for blockx=0:(size(f,2)/8-1)
    for blocky=0:(size(f,1)/8 - 1)
        F_sub = F( (blocky*8+1):(blocky*8+8), (blockx*8+1):(blockx*8+8));
        for x=0:7
            u = 0:7;
            cos_vec_xu = cos( (2* x + 1) * u * pi/16);
            for y=0:7
                v = 0:7;
                cos_vec_yv = cos( (2* y + 1) * v * pi/16);
                
                cos_vec = (cos_vec_xu' * cos_vec_yv);
                C_sub = C(u)' * C(v);
                
                tot = sum(sum( F_sub .* C_sub .* cos_vec));
                
                f(blocky*8 + x + 1, blockx*8 + y + 1) = 1/4*tot;
            end
        end
    end
end

f = f + 128;

end