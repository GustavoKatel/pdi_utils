function img_out = g_conv2file( img_in, filter_file )
%g_conv2file Reads the conv_matrix from 'filter_file' and apply on img_in
% Stores in img_out

newLine = char(10);
final = [',' newLine];

conv_matrix = zeros(3,3);
i = 1;
j = 1;

% lê a matrix do arquivo. Rebatimento já é aplicado.
f = fopen(filter_file, 'r');
line = fgets(f);
for i=1:3
	remain = strrep(line,',,',',0,');
	remain = strrep(remain, final, ',0');
	if remain(1)==','
        remain = ['0' remain];
	end
        
    for j=1:3
        [tok,remain] = strtok(remain, ',');
        conv_matrix( uint8(4) - i, uint8(4) - j ) = str2num(tok);
    end    
    
	line = fgets(f);
end
fclose(f);

img_out = g_conv2(img_in, conv_matrix);

end

