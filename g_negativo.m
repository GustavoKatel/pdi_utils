function img_out = g_negativo( img_in )
%g_negativo complements each pixel in img_in and put in img_out

img_out = img_in;

[m,n,c] = g_dim(img_in);

for i=1:m
    for j=1:n
        
        % for each channel color
        for k=1:c
            img_out(i,j,k) = 255-img_in(i,j,k);
        end
        
    end
end

end

