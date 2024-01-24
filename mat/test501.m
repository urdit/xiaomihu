%%生成原始信号
clear
clc
close all
t = 0:0.001:2;
s1 = cos(4*pi.*t);
figure
plot(t,s1)
%%
s2 = 1/4*cos(48*pi.*t);
figure
plot(t,s2)
%%
s3 = 1/16*cos(576*pi.*t);
figure
plot(t,s3)
%%
s4 = 3*wgn(1,length(t),10*log10(0.01));
figure
plot(t,s4)
figure
s = s1+s2+s3+s4;
plot(t,s)
save s.mat s  %保存s信号