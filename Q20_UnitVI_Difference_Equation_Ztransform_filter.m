clc; clear; close all;
% (a) Symbolic Z-Transform Solution
syms k z
H_z = (1 + 0.5*z^(-1)) / (1 - 1.3*z^(-1) + 0.4*z^(-2));
U_z = z / (z - 1);   % Unit step Z-transform
Y_z = H_z * U_z;
y_symbolic = iztrans(Y_z, z, k);
disp('Analytical Step Response y[k]:');
pretty(simplify(y_symbolic));
% (b) Numerical Simulation using filter()
b = [1, 0.5];         % Numerator coefficients
a = [1, -1.3, 0.4];   % Denominator coefficients
n = 0:20;
u = ones(size(n));    % Unit step input
y_num = filter(b, a, u);
figure;
stem(n, y_num, 'b', 'filled', 'LineWidth', 1.5);
grid on; title('Discrete-Time Unit Step Response via filter()');
xlabel('Sample Index k'); ylabel('Output y[k]');
