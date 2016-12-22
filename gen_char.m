function cdata = gen_char( letter, foreground, background, confusion )
%GEN_CHAR Generate a small image of a given character and return the data

% prepare a hidden figure with given background
figure('menubar','none','color',background,'position',[100,100,100,80],'visible','off');

% generate random continuous curve to confuse OCR
start_point = [rand; 0];
middle_point = [rand; 0.5];
end_point = [rand; 1];
% because fnplt does not accept the standard color argument, we need to
% manually find the handle and change its color...
gca_before = findall(gca);
fnplt(cscvn([start_point, middle_point, end_point]),4);
conf_axis = setdiff(findall(gca), gca_before);
set(conf_axis, 'Color', confusion);

% generate text
text('units','pixels','position',[45 46],'fontsize',55,'color',foreground,'string',letter,'rotation',270);
axis off
grid off

% get resulting frame
frame = getframe();

% return the cdata of frame
cdata = rot90(frame.cdata);

end

