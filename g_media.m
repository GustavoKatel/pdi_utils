function img_out = g_media( img_in, order )
%g_media Apply the mean filter in img_in and store in img_out
%   'order' defines the mean filter order

img_out = img_in;

[m, n, c] = g_dim(img_in);

fa = 1/(order*order);

for i=1:m
    for j=1:n
        
        sumr = 0;
        sumg = 0;
        sumb = 0;
        
        kernelr = g_vizinhanca(img_in, i, j, 1, order);
        sumr = sum(kernelr(:));
        if c==3
            kernelg = g_vizinhanca(img_in, i, j, 2, order);
            sumg = sum(kernelg(:));
            
            kernelb = g_vizinhanca(img_in, i, j, 3, order);
            sumb = sum(kernelb(:));
        end
              
        sumr = fa * sumr;
        sumg = fa * sumg;
        sumb = fa * sumb;
        
        img_out(i,j,1) = uint8(sumr);
        if c==3
            img_out(i,j,2) = uint8(sumg);
            img_out(i,j,3) = uint8(sumb);
        end
        
    end
end


end

