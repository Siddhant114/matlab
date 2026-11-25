clc; clear; close all;
A = [0 1; -4 -5];
B = [0; 1];
C = [1 0];
if rank(obsv(A, C)) < size(A, 1)
    error('System is unobservable.');
end
obs_poles = [-15, -16];
Ke = acker(A', C', obs_poles)';
disp('Observer Gain Matrix Ke:'); disp(Ke);
A_err = A - Ke*C;
sys_err = ss(A_err, [], eye(2), []);
e0 = [1.5; -1];
t = 0:0.01:1;
[~, t_out, e] = initial(sys_err, e0, t);
figure;
plot(t_out, e(:,1), 'b-', t_out, e(:,2), 'r--', 'LineWidth', 2);
grid on; legend('Error e_1(t)', 'Error e_2(t)');
title('Full-Order State Observer Estimation Error Convergence');
xlabel('Time (s)'); ylabel('Estimation Error');
