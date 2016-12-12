function [ base64string ] = encode_base64( cdata )
%ENCODE_BASE64 encodes a MATLAB image matrix as jpeg in base64
%
% string = base64img(cdata)
%  encodes the specified figure at 75-dpi resolution

% Author: Jan Nejtek
% Adapted from work of Michael Katz

if nargin == 0
    %use the top figure if none specified
    fig = gcf;
end
if nargin < 2
    %use 75-dpi if none specified
    dpi = 75;
end

% the easiest way to get the figure's data in jpeg format is to save it as
% temporary jpeg and clean it up afterwards
path = [tempname '.jpg'];
imwrite(cdata, path);

% then open the temporary file and convert it to base64 using the
% built-it converter
temp_fid = fopen(path,'rb');
temp_bytes = fread(temp_fid);
fclose(temp_fid);
base64string = matlab.net.base64encode(temp_bytes);

delete(path);
end

