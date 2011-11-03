clear
clc
clf
name = 'mt4p.out';%'nbod_3.out';
info = load(name);
hold on

n = 1 + max(info(:,1));
colors = 'yrgbcrgbcrgbc';

for i = 1 : n
    plot(info(i:n:end,2),info(i:n:end,3),[colors(i),'.-']);
end
axis equal;
%axis([ -0.8806    2.0220         0    2.2893 ])
totAxis = axis;
hold off
% pause(5);

for i = 1:n:size(info,1)-n
    for j = 1:n
        plot(info(i+j,2),info(i+j,3),[colors(j),'o'])
        hold on
    end
    hold off
    axis(totAxis);
    pause(0.0001);
end
disp('done')