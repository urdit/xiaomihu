%%
clc;clear; clc; close all; warning off;

%%EMD
[x,fs]=audioread(['C:\Users\fule_\OneDrive\桌面\Origin科研绘图与学术图表绘制从入门到精通\植物大战僵尸背景音乐_爱给网_aigei_com.wav']);
y=x(:,1);  % 双通道，只读取单声道的数据
y=y(501:1000);  % 选取501-1000之间的500个点做分析
t= 1:length(y);
imf=emd(y);  % 进行EMD分解各个固有模态函数IMF（i）
emd_visu(y,t,imf);  % 模态分解图（图1、2、3分别对应模态分解图，信号合成图1，信号合成图2）

%%