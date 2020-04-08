%padding is vrije keuze volgens de standaard
%spiegelen aan de randen lijkt mij wel interessant
%of gewoon afbeeldingen gebruiken wiens afmetingen een veelvoud zijn van 8
function Ig = pad_channel(Ig)
    ex = mod(size(Ig,2),8);
    ey = mod(size(Ig,1),8);
    if ex ~= 0
        ex = 8 - ex;
    end
    if ey ~= 0
        ey = 8 - ey;
    end

    a = 0;
    Ig(:, size(Ig,2):(size(Ig,2) + ex)) = a;
    Ig(size(Ig,1):(size(Ig,1) + ey), :) = a;
end
