function [ m,n,c ] = g_dim( img_in )
%g_dim return the dimensions of the image

dim = size(img_in);
m = dim(1);
n = dim(2);
c = size(img_in,3);

end

