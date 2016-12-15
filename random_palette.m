function [ light1, light2, dark1, dark2 ] = random_palette( input_args )
%RANDOM_PALETTE Generate a palette for MAPTCHA
%   The palette consists of two light and two dark colors

% the logic is that the first color should usually be
% lighter than the second color, but not always!

light1 = [0.9 + 0.1*rand, 0.9 + 0.1*rand, 0.9 + 0.1*rand]
light2 = [0.8 + 0.2*rand, 0.8 + 0.2*rand, 0.8 + 0.2*rand]

dark1 = [0.1 + 0.1*rand, 0.1 + 0.1*rand, 0.1 + 0.1*rand]
dark2 = [0.2*rand, 0.2*rand, 0.2*rand,]

end

