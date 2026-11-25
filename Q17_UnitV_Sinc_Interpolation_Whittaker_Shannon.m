clc; clear; close all;
f0 = 10;   % 10 Hz signal
fs = 50;   % 50 Hz sampling (> 20 Hz Nyquist rate)
Ts = 1/fs;
t_cont = 0:0.001:0.5;
x_cont = cos(2*pi*f0*t_cont);
n = 0:floor(0.5/Ts);
t_samp = n * Ts;
x_samp = cos(2*pi*f0*t_samp);
% Whittaker-Shannon Sinc Reconstruction
x_rec = zeros(size(t_cont));
for k = 1:length(n)
    x_rec = x_rec + x_samp(k) * sinc((t_cont - t_samp(k)) / Ts);
end
figure;
subplot(2,1,1);
plot(t_cont, x_cont, 'k-', 'LineWidth', 1.5); hold on;
plot(t_cont, x_rec, 'g--', 'LineWidth', 1.5);
stem(t_samp, x_samp, 'ro');
legend('Original Analog', 'Sinc Reconstructed', 'Samples');
grid on; title('Ideal Whittaker-Shannon Signal Reconstruction');
subplot(2,1,2);
plot(t_cont, abs(x_cont - x_rec), 'm-', 'LineWidth', 1.5);
grid on; title('Absolute Reconstruction Error');
xlabel('Time (s)'); ylabel('Error');
