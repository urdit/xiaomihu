%%
clc;clear; clc; close all; warning off;

t=1:500;t=t*1/2000;
x=sin(2*pi*20*t);
y=0.4*sin(2*pi*40*t+140);
z=x+y;
plot(t,z);   %画出原始的信号
imf=emd(z);
ti=1:length(z);
emd_visu(z,ti,imf);