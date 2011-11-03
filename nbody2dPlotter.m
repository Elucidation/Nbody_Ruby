clear
clc
clf

name = 'nbodyOut.txt';


fin = fopen(name,'r');
if fin < 0
    error(['Could not open ',name,' for input'])
end

%%%%%

positions = [];
t = 1;

while 1
    
    numberOfBodies = fgetl(fin);
    if (numberOfBodies == -1)
        break
    else
        numberOfBodies = str2double(numberOfBodies);
    end
    time = str2double(fgetl(fin)); % The time since start

    for i = 1:numberOfBodies
        mass = str2double(fgetl(fin));
        [posx,posy] = strtok(fgetl(fin));
        posx = str2double(posx);
        posy = str2double(posy);
        
        positionsx(i,t) = posx;
        positionsy(i,t) = posy;
        
        vel = fgetl(fin);
    end    
    t = t + 1;
end



%%%%%

fclose(fin);

c = {'r.-','bx-','go-'};

for k = 1:size(positionsx,1)
    plot(positionsx(k,:),positionsy(k,:),c{k});
    hold on;
end
hold off;
axis equal;