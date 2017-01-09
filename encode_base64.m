function [ base64string ] = encode_base64( cdata )
% ENCODE_BASE64 encodes a MATLAB image matrix as jpeg in base64
%
% string = base64img(cdata)

% the easiest way to get the figure's data in jpeg format is to save it as
% temporary jpeg and clean it up afterwards
path = [tempname '.jpg'];
imwrite(cdata, path);

% then open the temporary file and convert it to base64
temp_fid = fopen(path,'rb');
temp_bytes = fread(temp_fid);
fclose(temp_fid);

% matlab.net.base64encode is available only in R2016b and later...
if exist('matlab.net.base64encode', 'class')
    base64string = matlab.net.base64encode(temp_bytes);
else 
    base64string = base64_legacy(temp_bytes, 'matlab', false, false); 
end

% get rid of the temp file
delete(path);
end

