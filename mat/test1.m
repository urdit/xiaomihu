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
angle = unwrap(angle(s_analy));  % 解析信号的相位,unwrap反正切，angle求复数相角
fi = diff(angle) / 2 / pi * fs;  % 瞬时频率，diff求导
 
% 作图
figure;
subplot(2, 2, 1);plot(t, a); title('包络（调幅信号）');
subplot(2, 2, 2); plot(t, b); title('调相信号');
subplot(2, 2, 3); plot(t, c); title('载波');
subplot(2, 2, 4); 
plot(t, s, 'b'); hold on;
plot(t, sh, 'r--'); hold off;
legend('调制结果', '调制信号的希尔伯特变换'); title('调制信号');
%% FFT分析
NFFT = 2 ^ nextpow2(N);  % 填充传递到 fft 的信号。当信号长度并非 2 次幂时，这样做可以加快 FFT 的运算速度
f = (0 : NFFT-1) / NFFT * fs;
sFFT = fft(s, NFFT);  % 原始信号FFT
saFFT = fft(s_analy, NFFT);  % 解析信号FFT
envFFT = fft(envelope, NFFT);  % 包络的FFT
 
figure;
subplot(3, 2, 1); 
plot(t, envelope); hold on;
plot(t, a, '--'); hold off; 
legend('瞬时包络绝对值', '真实包络'); title('瞬时包络');
subplot(3, 2, 2); plot(t, angle); title('瞬时相位');
subplot(3, 2, 3); plot(t(2:end), fi); title('瞬时频率');
subplot(3, 2, 4); plot(f, abs(sFFT)); title('原始信号FFT');
subplot(3, 2, 5); plot(f, abs(saFFT)); title('解析信号FFT');
subplot(3, 2, 6); plot(f, abs(envFFT)); title('包络的FFT');