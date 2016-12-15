function cdata = gen_char( letter, foreground, background )
%GEN_CHAR Generate a small image of a given character and return the data

% generate empty 40x40 image
im = ones(40,40,3);
% prepare a matching figure
figure('menubar','none','color','w','position',[100,100,100,80],'color',background,'visible','off');
image(im);
% generate text
text('units','pixels','position',[45 46],'fontsize',65,'color',foreground,'string',letter,'rotation',270);
axis off
grid off

% get resulting frame
frame = getframe();

% return the cdata of frame
cdata = rot90(frame.cdata);

end

