close all
clear all
clc
fid=fopen('sig1.txt','rt');
f=fscanf(fid,'%f',[2,inf]);
t=f(1,:);
y=f(2,:);
fclose(fid);
y=y(end:-1:1);
 
Td=t(2)-t(1);
Fd=1/Td;
fN=Fd/2;
plot(y)

figure(2)
fid=fopen('sig2.txt','rt');
f=fscanf(fid,'%f',[2,inf]);
t=f(1,:);
y=f(2,:);
fclose(fid);
y=y(end:-1:1);
 
Td=t(2)-t(1);
Fd=1/Td;
fN=Fd/2;
plot(y)

figure(3)
fid=fopen('sig3.txt','rt');
f=fscanf(fid,'%f',[2,inf]);
t=f(1,:);
y=f(2,:);
fclose(fid);
y=y(end:-1:1);
 
Td=t(2)-t(1);
Fd=1/Td;
fN=Fd/2;
plot(y)

figure(4)
fid=fopen('sig4.txt','rt');
f=fscanf(fid,'%f',[2,inf]);
t=f(1,:);
y=f(2,:);
fclose(fid);
y=y(end:-1:1);
 
Td=t(2)-t(1);
Fd=1/Td;
fN=Fd/2;
plot(y)