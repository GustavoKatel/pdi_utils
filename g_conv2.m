function img_out = g_conv2( img_in, conv_matrix )
%g_conv2 apply the mask/filter described in conv_matrix on img_in.
% stores in img_out

img_out = img_in;

img_out = img_in;
[m, n, c] = g_dim(img_in);

for i=1:m
    for j=1:n
        for k=1:c
            cr = conv2_color(img_in, conv_matrix, i, j, k);
            img_out(i,j,k) = cr;
        end
    end
end

end

function color = conv2_color( img, conv_matrix, i, j, c)

    [m, n] = size(conv_matrix);
    kernel = double(g_vizinhanca(img, i, j, c, m));
    kernel = kernel.*conv_matrix;
    color = sum(kernel(:));
    color = uint8(color);
    
end