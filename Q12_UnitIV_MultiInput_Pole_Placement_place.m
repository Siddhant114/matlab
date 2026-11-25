clc; clear; close all;
A = [0 1 0; 0 0 1; -1 -5 -6];
B = [0 1; 1 0; 0 1];
n = size(A, 1);
if rank(ctrb(A, B)) == n
    disp('Multi-input system is completely controllable.');
else
    error('System is uncontrollable.');
end
desired_poles = [-2, -3, -4];
K = place(A, B, desired_poles);
disp('Multi-Input Feedback Gain Matrix K (2x3):');
disp(K);
disp('Verified Closed-Loop Eigenvalues:');
disp(eig(A - B*K));
