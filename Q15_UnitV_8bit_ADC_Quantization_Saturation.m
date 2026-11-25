clc; clear; close all;
N = 8;                 % 8-bit ADC
V_min = 0; V_max = 5;  % 0 to 5 V range
levels = 2^N;          % 256 levels
LSB = (V_max - V_min) / levels;
fprintf('8-Bit ADC Resolution (1 LSB) = %.4f mV\n', LSB*1000);
Vin = -0.5:0.01:5.5;
V_clamped = min(max(Vin, V_min), V_max);
digital_code = min(floor((V_clamped - V_min) / LSB), levels - 1);
test_V = [2.5, 6.0];
for v = test_V
    vc = min(max(v, V_min), V_max);
    code_val = min(floor((vc - V_min) / LSB), levels - 1);
    fprintf('Vin = %.2f V -> Decimal Code = %d, Binary = %s\n', v, code_val, dec2bin(code_val, 8));
end
figure;
plot(Vin, digital_code, 'b-', 'LineWidth', 1.8);
grid on; title('8-Bit ADC Transfer Characteristic (0-5 V Range)');
xlabel('Analog Input Voltage Vin (V)'); ylabel('Digital Output Code (0-255)');
