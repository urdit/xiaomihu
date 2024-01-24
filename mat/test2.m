%% 
clear; clc; close all; warning off;

%% 生成调制信号
fs = 400;  % 采样频率
Ts = 1 / fs;
N = 400;  % 观测时长
t = (0 : N-1) * Ts;

fa = 5;  % 调幅单频
fp = 10;  % 调相单频
fc = 30;  % 载波单频
a = 1 + 0.5 * cos(2 * pi * fa * t);  % 调幅包络
b = 0.5 * sin(2 * pi * fp * t);  % 调相
c = cos(2 * pi * fc * t);  % 载波
s = a .* cos(2 * pi * fc * t + b);  % 调制信号

%% Hilbert分析 
s_analy = hilbert(s);  % Matlab的hilbert命令得到的是解析信号
sh = imag(s_analy);  % 调制信号的希尔伯特变换
envelope = abs(s_analy);  % 解析信号包络的绝对值
angle = unwrap(angle(s_analy));  % 解析信号的相位
fi = diff(angle) / 2 / pi * fs;  % 瞬时频率

% 作图
figure;
subplot(2, 2, 1);plot(t, a); title('包络（调幅信号）');
subplot(2, 2, 2); plot(t, s); title('调相信号');
subplot(2, 2, 3); plot(t, s_analy); title('hilbert');
subplot(2, 2, 4); 
plot(t, s, 'b'); hold on;
plot(t, sh, 'r--'); hold off;
legend('调制结果', '调制信号的希尔伯特变换'); title('调制信号');