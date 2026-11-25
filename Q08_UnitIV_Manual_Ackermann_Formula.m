clc; clear; close all;
A = [0 1 0; 0 0 1; 0 -2 -3];
B = [0; 0; 1];
n = size(A, 1);
desired_poles = [-2, -3, -4];
% Manual Ackermann Computation
Qc = ctrb(A, B);
phi_coeffs = poly(desired_poles);   % s^3 + 9s^2 + 26s + 24
phi_A = polyvalm(phi_coeffs, A);    % Matrix polynomial evaluation
e_n = [zeros(1, n-1), 1];
K_manual = e_n * inv(Qc) * phi_A;
% Built-in Verification
K_builtin = acker(A, B, desired_poles);
disp('Manual Ackermann Gain K:'); disp(K_manual);
disp('Built-in acker() Gain K:'); disp(K_builtin);
disp('Verified Closed-Loop Poles:'); disp(eig(A - B*K_manual)');
