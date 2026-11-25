clc; clear; close all;
T = 0.1;
num = [0.35, 0.15];
den = [1, -1.3, 0.55];
T_cl = tf(num, den, T);
% Compute Poles, Magnitudes & Damping
p = pole(T_cl);
fprintf('Closed-loop Poles: %.4f %+.4fi (Magnitude r = %.4f)\n', ...
    real(p(1)), imag(p(1)), abs(p(1)));
damp(T_cl);
% Step Response Metrics
info = stepinfo(T_cl);
disp('Step Response Specifications:'); disp(info);
% Plot Pole-Zero Map with zgrid
figure;
pzmap(T_cl);
zgrid;
title('z-Plane Pole-Zero Map with Constant Damping Contours');
