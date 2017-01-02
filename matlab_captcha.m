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

% reset the seed of rand because when running in a compiled environment,
% rand is initialized to the same state on each launch and that can
% cause it to generate the same code each time MAPTCHA is run
reset(RandStream.getGlobalStream,sum(100*clock));

possible_letters = 'ABCDEFHKLMNPRSTUVXYZabcdekmnrstuvwxz23456789';
captcha_code = [ ...
    possible_letters(round(rand*length(possible_letters))), ...
    possible_letters(round(rand*length(possible_letters))), ...
    possible_letters(round(rand*length(possible_letters))), ...
    possible_letters(round(rand*length(possible_letters)))];

% generate the captcha letters
ltr1 = gen_char(captcha_code(1), dark1, light1, dark2);
ltr2 = gen_char(captcha_code(2), light1, dark1, light2);
ltr3 = gen_char(captcha_code(3), dark2, light2, dark1);
ltr4 = gen_char(captcha_code(4), light1, dark2, light2);

% make sure they are the same size (thx, MATLAB)
ltr1 = ltr1(1:60,1:49,1:3);
ltr2 = ltr2(1:60,1:49,1:3);
ltr3 = ltr3(1:60,1:49,1:3);
ltr4 = ltr4(1:60,1:49,1:3);

% concat them to an image and encode it to base64 JPG
result = [ltr1, ltr2, ltr3, ltr4];
result_b64 = encode_base64(result);

% print the code, a newline and the base64 to stdout
fprintf('%s\n%s\n', captcha_code, result_b64);