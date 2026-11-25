clc; clear; close all;
f = 6;     % 6 Hz signal
fs = 36;   % 36 Hz sampling frequency
Ts = 1/fs;
t_cont = 0:0.001:0.35;
x_cont = 3 * cos(2*pi*f*t_cont);
t_samp = 0:Ts:0.35;
x_samp = 3 * cos(2*pi*f*t_samp);
figure;
plot(t_cont, x_cont, 'k-', 'LineWidth', 1.5); hold on;
stairs(t_samp, x_samp, 'b-', 'LineWidth', 1.5);
plot(t_samp, x_samp, 'r--o', 'LineWidth', 1.2, 'MarkerFaceColor', 'r');
grid on;
legend('Original Analog Signal', 'ZOH Reconstruction (Staircase)', 'FOH Reconstruction (Linear)');
title('Comparison of ZOH and FOH Signal Reconstruction');
xlabel('Time (s)'); ylabel('Amplitude');
