clc
clear
name =  'euler_forward_long_time.out';
name2 = 'euler_modified_long_time.out';
name3 = 'leapfrog_vector_long_time.out';
name4 = 'le.out'
names = {name4};

figure()
hold on;
for i = 1:length(names)
    info = load(names{i});
    %subplot(2,2,i), 
    %plot(info(:,1),info(:,2),'r.');
    plot(info(:,7),'r.')
    %axis equal;
end