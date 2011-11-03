clear
clc
clf
name = 'nbod_2.out';
info = load(name);
hold on
plot(info(1:2:end,2),info(1:2:end,3),'r.-');
plot(info(2:2:end,2),info(2:2:end,3),'b.-');
axis equal;
%axis([ -0.8806    2.0220         0    2.2893 ])
totAxis = axis;
hold off
pause(5);

for i = 1:2:size(info,1)
    plot(info(i,2),info(i,3),'ro',...
         info(i+1,2),info(i+1,3),'bo');
    axis(totAxis);
    pause(0.0001);
end