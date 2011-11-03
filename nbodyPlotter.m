clear
clc

name = 'nbodyOut.txt';


fin = fopen(name,'r');
if fin < 0
    error(['Could not open ',name,' for input'])
end

%%%%% Going to redo as nbody2dPlotter, since the strtok is tricky
buffer = fgetl(fin);
n = buffer;
while true
    buffer = fgetl(fin);
    if (buffer == -1)
        break
    end
    %%%
    
    
    
end


%%%%%

fclose(fin);