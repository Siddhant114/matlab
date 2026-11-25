clc; clear; close all;
T = 0.5;
s = tf('s');
G1_s = 1 / (s + 1);
G2_s = 1 / (s + 3);
% Case 1: No sampler between blocks -> Z{G1(s)*G2(s)}
G1G2_z = c2d(G1_s * G2_s, T, 'impulse');
% Case 2: Sampler between blocks -> G1(z) * G2(z)
G1_z = c2d(G1_s, T, 'impulse');
G2_z = c2d(G2_s, T, 'impulse');
G1_times_G2_z = G1_z * G2_z;
disp('Case 1: Z{G1(s)*G2(s)} (No intermediate sampler):'); disp(G1G2_z);
disp('Case 2: G1(z)*G2(z) (With intermediate sampler):'); disp(G1_times_G2_z);
figure;
step(G1G2_z, 'b-', G1_times_G2_z, 'r--', 6);
legend('Z\{G_1(s)G_2(s)\} (No Sampler Between)', 'G_1(z)G_2(z) (Sampler Between)');
grid on; title('Effect of Intermediate Sampler on Discrete Response');
