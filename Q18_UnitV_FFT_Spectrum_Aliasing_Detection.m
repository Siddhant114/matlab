clc; clear; close all;
fs = 70;       % Sampling frequency = 70 Hz (Nyquist = 35 Hz)
T = 1/fs;
L = 70;        % 1 second duration (70 samples)
t = (0:L-1)*T;
% Signal with 15 Hz and 45 Hz components
x = sin(2*pi*15*t) + 0.8*sin(2*pi*45*t);
% Compute Single-Sided FFT Spectrum
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure;
stem(f, P1, 'b', 'filled', 'LineWidth', 1.5);
grid on; title('Single-Sided Amplitude Spectrum (fs = 70 Hz)');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
