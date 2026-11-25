clc; clear; close all;
T = 1;
z = tf('z', T);
G_z = (0.368*z + 0.264) / ((z - 1)*(z - 0.368));
G_w = d2c(G_z, 'tustin');
disp('Bilinear Transformed Transfer Function G(w):'); disp(G_w);
K_vals = 0.1:0.05:5;
K_max = 0;
for K = K_vals
    CL = feedback(K * G_z, 1);
    if all(abs(pole(CL)) < 1)
        K_max = K;
    else
        break;
    end
end
fprintf('Maximum Gain K for Discrete Stability: K_max = %.2f\n', K_max);
figure;
rlocus(G_z);
zgrid;
title('Discrete-Time Root Locus in the z-Plane');
