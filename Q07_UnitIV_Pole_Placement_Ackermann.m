clc; clear; close all;
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = [0];
if rank(ctrb(A, B)) < size(A, 1)
    error('System is uncontrollable; pole placement impossible.');
end
desired_poles = [-4 + 3j, -4 - 3j];
K = acker(A, B, desired_poles);
disp('State Feedback Gain Matrix K:'); disp(K);
A_cl = A - B*K;
disp('Closed-Loop Eigenvalues:'); disp(eig(A_cl));
sys_open = ss(A, B, C, D);
sys_closed = ss(A_cl, B, C, D);
figure;
step(sys_open, 'r--', sys_closed, 'b-', 4);
legend('Uncompensated System', 'Compensated (Pole Placement)');
grid on; title('Step Response Comparison');
