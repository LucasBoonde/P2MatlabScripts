%            alpha      a        d     modified D&H
%                                      Because we use Craig            
 
L1=Link('d',89.159,'a',  0,'alpha',  0,       'modified');
L2=Link('d',  0,'a', 0,'alpha', 90*pi/180,'offset', 180*pi/180,'modified');
L3=Link('d',  0,'a',425,'alpha',  0,       'modified');
L4=Link('d',109.15,'a',  392.25,'alpha',0,'modified');
L5=Link('d',  94.65,'a',  0,'alpha',-90*pi/180, 'modified');
L6=Link('d',  82.3,'a',  0,'alpha', 90*pi/180, 'offset', 180*pi/180, 'modified');
 
ABB140=SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'UR5');

ABB140.teach