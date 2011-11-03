clear
clc

name = 'velPos2body.txt';
info = load(name);
positions = info(1:2:end,:);

plot(positions(:,1),positions(:,2))