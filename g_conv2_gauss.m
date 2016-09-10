function img_out = g_conv2_gauss( img_in, sigma, sigma_range )
%g_conv2_gauss Apply the g_conv2 on img_in using gaussian samples as

sigma_min = -sigma_range;
sigma_max = sigma_range;

xi = sigma_min*sigma : sigma_max*sigma; % samples range: x
yi = sigma_min*sigma : sigma_max*sigma; % samples range: y

dist = 2 * sigma_range * sigma; % end - begin

gi = zeros(dist, dist);

va = ( 1 / (sqrt(2*pi)*sigma) );
vb = (2*sigma*sigma);

for i=xi
    for j=yi
        
        px = uint8(i+sigma_max*sigma+1);
        py = uint8(j+sigma_max*sigma+1);
        
        value = va * exp( -( i^2 + j^2 ) / vb );
        
        gi(px, py) = value;
        
    end
end

gi = gi/sum(gi(:)); % normalization

img_out = img_in;
[m, n, c] = g_dim(img_in);

for i=1:m
    for j=1:n
        for k=1:c
            img_out(i,j,k) = conv2_color(img_in, gi, i, j, k);
        end
    end
end

end

function color = conv2_color( img, conv_matrix, i, j, c)

    [m, n] = size(conv_matrix);
    kernel = double(g_vizinhanca(img, i, j, c, m));
    kernel = kernel.*conv_matrix;
    color = sum(kernel(:));
    color = uint8(abs(color));
    
end