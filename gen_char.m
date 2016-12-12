function cdata = gen_char( letter )
%GEN_CHAR Generate a small image of a given character and return the data

% generate empty 100x100 image
im = ones(40,40,3);
% prepare a matching figure
figure('menubar','none','color','w','position',[100,100,100,80],'visible','off');
image(im);
% generate text
text('units','pixels','position',[45 46],'fontsize',65,'string',letter,'rotation',270);
axis off
grid off

% get resulting frame
frame = getframe();

% return the cdata of frame
cdata = rot90(frame.cdata);

% save the cdata of frame as image
% imwrite(cdata, path);

% saving and concating the images:
% imshow(double([genCharImg('f'),genCharImg('u'),genCharImg('c'),genCharImg('k')]));
% imwrite([genCharImg('f'),genCharImg('u'),genCharImg('c'),genCharImg('k')],'fugg.jpg');
% etc...

end

