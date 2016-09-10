function out = g_vizinhanca( img_in, i, j, k, order )
%g_vizinhanca Returns an array with the neighborhood

[m, n, c] = g_dim(img_in);

out = uint8(zeros(order,order));

if mod(order,2)==0
    dist = uint8(order/2);
else
    dist = uint8(order/2)-1;
end

dist = double(dist);

plefti = double(i) - dist;
pleftj = double(j) - dist;
        
prighti = double(i) + dist;
prightj = double(j) + dist;

if mod((order*order),2)==0
    plefti = plefti + 1;
    pleftj = pleftj + 1;
end

pos = 1;

for pj= pleftj:prightj
    for pi= plefti:prighti
        
        if pi>0 && pi<=m && pj>0 && pj<=n
            out(pos) = img_in(pi, pj, k);
        end
        pos = pos+1;
        
	end
end

end

