%encodeert een afbeelding f, bestaande uit enkel grijstinten
function F = encode_channel(f)
f = f - 128;

F = zeros(size(f));
C = @(u) sqrt(1/2)^(u==0);

for blockx=0:(size(f,2)/8-1)
    for blocky=0:(size(f,1)/8 - 1)
        f_sub = f( (blocky*8+1):(blocky*8+8), (blockx*8+1):(blockx*8+8));
        for u=0:7
            
            cos_vec_xu = cos( (2* (0:7) + 1) * u * pi/16);
            for v=0:7
                cos_vec_yv = cos( (2* (0:7) + 1) * v * pi/16);
                cos_vec = (cos_vec_yv' * cos_vec_xu);
                
                tot = sum(sum( f_sub .* cos_vec));
                
                F(blocky*8 + v + 1, blockx*8 + u + 1) = 1/4*C(u)*C(v)*tot;
            end
        end
    end
end

end