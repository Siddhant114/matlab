clc; clear; close all;
A = [0 1; -3 -4];
Q = eye(2);
P = lyap(A', Q);
disp('Lyapunov Matrix P:'); disp(P);
eig_P = eig(P);
disp('Eigenvalues of P:'); disp(eig_P);
if all(eig_P > 0) && isequal(round(P,6), round(P',6))
    disp('All eigenvalues of P > 0 -> System is ASYMPTOTICALLY STABLE.');
else
    disp('System is NOT asymptotically stable.');
end
sys = ss(A, [], eye(2), []);
t = 0:0.05:5;
x0 = [2; -1];
[~, t_out, x] = initial(sys, x0, t);
V = zeros(length(t_out), 1);
for k = 1:length(t_out)
    xk = x(k, :)';
    V(k) = xk' * P * xk;
end
figure;
plot(t_out, V, 'b-', 'LineWidth', 2);
grid on; title('Lyapunov Energy Function V(x) = x^T P x');
xlabel('Time (s)'); ylabel('V(x)');
