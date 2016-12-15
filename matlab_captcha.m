% MAPTCHA
%
% Matlab
% Awesome
% Public
% Turing Test To Tell
% Computers and
% Humans
% Apart

[ light1, light2, dark1, dark2 ] = random_palette;

ltr1 = gen_char('a', dark1, light1);
ltr2 = gen_char('h', light1, dark1);
ltr3 = gen_char('o', dark2, light2);
ltr4 = gen_char('j', light1, dark2);

result = [ltr1, ltr2, ltr3, ltr4];

encode_base64(result)