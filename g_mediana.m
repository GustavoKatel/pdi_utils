function img_out = g_mediana( img_in, order )
%g_mediana Apply the median filter in img_in and store in img_out
%   'order' defines the median filter order

img_out = img_in;

[m, n, c] = g_dim(img_in);

order2 = order*order;

for i=1:m
    for j=1:n
        
        vecr = g_vizinhanca(img_in, i, j, 1, order);
        vecr = sort(vecr(:));
        if c==3
            vecg = g_vizinhanca(img_in, i, j, 2, order);
            vecg = sort(vecg(:));
            
            vecb = g_vizinhanca(img_in, i, j, 3, order);
            vecb = sort(vecb(:));
        end
               
        pos = uint8( order2 )/2;
        if mod( order2 , 2 )==0
            medianar = ( vecr(pos) + vecr(pos+1) ) / 2;
            if c==3
                medianag = ( vecg(pos) + vecg(pos+1) ) / 2;
                medianab = ( vecb(pos) + vecb(pos+1) ) / 2;
            end
        else
            medianar = vecr(pos);
            if c==3
                medianag = vecg(pos);
                medianab = vecb(pos);
            end
        end
        
        img_out(i,j,1) = uint8(medianar);
        if c==3
            img_out(i,j,2) = uint8(medianag);
            img_out(i,j,3) = uint8(medianab);
        end
        
    end
end


end