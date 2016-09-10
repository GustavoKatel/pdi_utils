function [ y, i, q ] = g_yiq( r, g, b )
%g_yiq return the equivalent y, i and q from a certain pixel
%   r, g and b are uint8. y, i and q are double

    rd = double(r)/255;
    gd = double(g)/255;
    bd = double(b)/255;
    
    y = 0.299 * rd + 0.587 * gd + 0.114 * bd;
	i = (0.59576 * rd)  + (-0.274453 * gd) + (-0.321263 * bd);
	q = (0.211456 * rd) + (-0.522591 * gd) + (0.311135 * bd);




end

