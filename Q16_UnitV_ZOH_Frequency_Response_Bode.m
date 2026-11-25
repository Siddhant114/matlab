clc; clear; close all;
T = 0.05;                     % Sampling period = 0.05 s (fs = 20 Hz)
f = logspace(-1, 1.6, 500);   % 0.1 Hz to ~40 Hz
w = 2 * pi * f;
% Exact ZOH Frequency Response: (1 - exp(-j*w*T)) ./ (j*w)
G_zoh = (1 - exp(-1j * w * T)) ./ (1j * w);
mag_dB = 20 * log10(abs(G_zoh) / T);   % Normalized to DC gain T
phase_deg = unwrap(angle(G_zoh)) * (180 / pi);
% Evaluate at Nyquist Frequency (f_nyq = 10 Hz)
f_nyq = 1 / (2*T);
G_nyq = (1 - exp(-1j * 2*pi*f_nyq * T)) / (1j * 2*pi*f_nyq);
fprintf('At Nyquist Frequency (%.1f Hz): Normalized Mag = %.2f dB, Phase = %.1f deg\n', ...
    f_nyq, 20*log10(abs(G_nyq)/T), angle(G_nyq)*180/pi);
figure;
subplot(2,1,1); semilogx(f, mag_dB, 'b-', 'LineWidth', 1.8); grid on;
title('Normalized Frequency Response of Zero-Order Hold (T = 0.05 s)');
ylabel('Magnitude (dB)');
subplot(2,1,2); semilogx(f, phase_deg, 'r-', 'LineWidth', 1.8); grid on;
xlabel('Frequency (Hz)'); ylabel('Phase Lag (deg)');
