function img_out = g_histeq( img_in )
%g_histeq Equalization of the img_in histogram

img_out = img_in;

[m, n, c] = g_dim(img_in);

for k=1:c
    img_out = histeq(img_out, k);
end

end

function img_out = histeq( img_in, cor )

img_out = img_in;

levels = 256 -1;

[m, n, c] = g_dim(img_in);

vec = img_in(:, :, cor);

histograma = zeros(1, levels+1);

[vm, vn] = size(vec);
for i=1:vm
    for j=1:vn
        level = vec(i, j);
        aux = histograma(level+1); % matlab: 1-256, rgb: 0-255
        histograma(level+1) = aux+1;
    end
end

chistograma = zeros(1, 256);
for i=2:256
    chistograma(i) =  histograma(i) + chistograma(i-1);
end

op1 = levels/double(m*n);
for i=1:m
    for j=1:n
        r = img_in(i, j, cor)+1; % matlab: 1-256, rgb: 0-255
        soma = chistograma(r);
        valor = uint8(op1 * soma); % also does 'round'
        img_out(i, j, cor) = valor;
    end
end

end