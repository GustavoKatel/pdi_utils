function img_out = g_contraste( img_in, order, p )
%g_contraste Apply the adaptive contrast in img_in. Stores in img_out

img_out = img_in;

[m, n, c] = g_dim(img_in);

for k=1:c
    img_out = contraste(img_out, order, p, k);
end

end


function img_out = contraste( img_in, order, p, cor )

img_out = img_in;

[m, n, c] = g_dim(img_in);

for i=1:m
    for j=1:n

        kernel = g_vizinhanca(img_in, i, j, cor, order);
        block = double(kernel(:));
        
        media  = mean(block);
        desvio = std(block);
               
        if desvio ~= 0
            original = double(img_in(i, j, cor));
            valor = media + ( double(p) * (original - media) ) / desvio;
            valor = uint8(valor);
            img_out(i, j, cor) = valor;
        end
        
    end
end


end

