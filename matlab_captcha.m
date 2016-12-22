% MAPTCHA
%
% MATLAB
% Awesome
% Public
% Turing Test To Tell
% Computers and
% Humans
% Apart

% generate palette of colors
[ light1, light2, dark1, dark2 ] = random_palette;

possible_letters = 'ABCDEFHKLMNPRSTUVXYZabcdekmnrstuvwxyz23456789';

% generate the captcha letters
ltr1 = gen_char(possible_letters(round(rand*length(possible_letters))), dark1, light1, dark2);
ltr2 = gen_char(possible_letters(round(rand*length(possible_letters))), light1, dark1, light2);
ltr3 = gen_char(possible_letters(round(rand*length(possible_letters))), dark2, light2, dark1);
ltr4 = gen_char(possible_letters(round(rand*length(possible_letters))), light1, dark2, light2);

% make sure they are the same size (thx, MATLAB)
ltr1 = ltr1(1:85,1:50,1:3);
ltr2 = ltr2(1:85,1:50,1:3);
ltr3 = ltr3(1:85,1:50,1:3);
ltr4 = ltr4(1:85,1:50,1:3);

% concat them to an image
result = [ltr1, ltr2, ltr3, ltr4];

encode_base64(result)