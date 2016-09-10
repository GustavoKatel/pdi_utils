function img_out = g_histexp( img_in )
%g_histexp Expansion of the img_in histogram.

img_out = img_in;

[m, n, c] = g_dim(img_in);

for k=1:c
    img_out = histexp(img_out, k);
end

end

function img_out = histexp(img_in, cor)

img_out = img_in;

levels = 256 -1;

[m, n, c] = g_dim(img_in);

vec = img_in(:, :, cor);

rmax = max(vec(:));
rmin = min(vec(:));

b = double(rmax - rmin);

for i=1:m
    for j=1:n
        
        r = img_in(i, j, cor);
        
        valor = uint8( double(r - rmin) * levels / b  ); % also does 'round'
        
        img_out(i, j, cor) = valor;
        
    end
end

end