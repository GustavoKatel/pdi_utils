function [ r, g, b ] = g_rgb( y, i, q )
%g_rgb convert yiq to rgb.
%   r, g and b are uint8 and y, i and q are double

    r =  y + (0.9563 * i) + (0.6210 * q);
    if r>1
        r = 1;
    end
    if r<0
        r = 0;
    end
    r = uint8(r * 255);  

    g =  y + (-0.2721 * i) + (-0.6474 * q);
    if g>1
        g = 1;
    end
    if g<0
        g = 0;
    end
    g = uint8(g * 255);

    b =  y + (-1.1070 * i) + (1.7046 * q);
    if b>1
        b = 1;
    end
    if b<0
        b = 0;
    end
    b = uint8(b * 255);


end

