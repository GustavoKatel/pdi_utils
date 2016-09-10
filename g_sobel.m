function img_out = g_sobel( img_in )
%g_sobel Sobel gradient

img_out = img_in;

[m, n, c] = g_dim(img_in);

for i=1:n
    for j=1:m
        for k=1:c
            sum = sobel(img_in, i, j, k);
            img_out(i,j,k) = sum;
        end
    end
end

end

function out = sobel(img, i, j, c)
    viz = double(g_vizinhanca(img, i, j, c, 3));
    sum = 0;
    
    pi = 2;
    pj = 2;
    sum = viz(pi+1, pj-1) + 2.0 * viz(pi+1, pj) + viz(pi+1, pj+1);
    sum = sum -viz(pi-1, pj-1) - 2.0*viz(pi-1, pj) - viz(pi-1, pj+1);
    sum = uint8(sum);
    
    aux = viz(pi-1, pj+1) + viz(pi, pj+1) + viz(pi+1, pj+1);
    aux = aux - viz(pi-1, pj-1) - 2.0 * viz(pi, pj-1) - viz(pi+1, pj-1);
    aux = uint8(aux);
    
    out = sum + aux;
end

% |f(i+1, j-1) + 2f(i+1, j) + f(i+1, j+1) +
% - f(i-1, j-1) - 2f(i-1, j) - f(i-1, j+1)| +
% + |f(i-1, j+1) + f(i, j+1) + f(i+1, j+1) +
% - f(i-1, j-1) - 2f(i, j-1) - f(i+1, j-1)|

