clc; clear; close all;
A = [0 1; -2 -1];
B = [0; 1];
C = [1 0];
ctrl_poles = [-2, -3];
obs_poles = [-10, -12];
K = acker(A, B, ctrl_poles);
Ke = acker(A', C', obs_poles)';
% Augmented 4x4 State Matrix in [x; e] coordinates
A_aug = [A - B*K,      B*K;
         zeros(2, 2),  A - Ke*C];
aug_eigs = eig(A_aug);
disp('Eigenvalues of Augmented Controller-Observer System:');
disp(sort(aug_eigs));
% Simulate initial response of actual vs estimated states
x0 = [2; -1];
xhat0 = [0; 0];
e0 = x0 - xhat0;
sys_aug = ss(A_aug, [], eye(4), []);
[y, t] = initial(sys_aug, [x0; e0], 0:0.02:3);
figure;
plot(t, y(:,1), 'b-', t, y(:,1)-y(:,3), 'r--', 'LineWidth', 1.8);
legend('Actual State x_1(t)', 'Estimated State x_{hat,1}(t)');
grid on; title('Observer-Based State Feedback Tracking');
