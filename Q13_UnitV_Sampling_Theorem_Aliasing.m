clc; clear; close all;
f_sig = 25;   % 25 Hz signal
A_sig = 2.5;  % 2.5 V amplitude
t_cont = 0:0.0005:0.12;
x_cont = A_sig * sin(2*pi*f_sig*t_cont);
fs_list = [35, 50, 150];
titles = {'Undersampling (fs = 35 Hz - Aliasing)', ...
          'Nyquist Rate (fs = 50 Hz)', ...
          'Oversampling (fs = 150 Hz - Accurate)'};
figure;
for i = 1:3
    fs = fs_list(i);
    Ts = 1/fs;
    t_samp = 0:Ts:0.12;
    x_samp = A_sig * sin(2*pi*f_sig*t_samp);

    subplot(3, 1, i);
    plot(t_cont, x_cont, 'b-', 'LineWidth', 1.2); hold on;
    stem(t_samp, x_samp, 'ro', 'filled', 'LineWidth', 1.2);
    plot(t_samp, x_samp, 'r--', 'LineWidth', 1);
    grid on; title(titles{i});
    xlabel('Time (s)'); ylabel('Amplitude (V)');
end
