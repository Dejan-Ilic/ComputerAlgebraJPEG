%voert functie uit op de drie kanalen tegelijk, en plakt ze dan terug aan
%elkaar
function out = three_channels(func, varargin)
    Ic = varargin{1};
    if nargin == 2
        out1 = func(Ic(:,:,1));
        out2 = func(Ic(:,:,2));
        out3 = func(Ic(:,:,3));
    elseif nargin == 4
        Qlum = varargin{2};
        Qchr = varargin{3};
        out1 = func(Ic(:,:,1), Qlum);
        out2 = func(Ic(:,:,2), Qchr);
        out3 = func(Ic(:,:,3), Qchr);
    else
        disp("error in three channels")
    end
    
    out = cat(3, out1, out2, out3);
end