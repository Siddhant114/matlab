clc; clear; close all;
A = [-1 2; -3 -2];
Q = [4 0; 0 4];
P = lyap(A', Q);
disp('Solution Matrix P:'); disp(P);
% Check Sylvester's Leading Principal Minors
n = size(P, 1);
minors = zeros(n, 1);
for i = 1:n
    minors(i) = det(P(1:i, 1:i));
    fprintf('Leading Principal Minor Delta_%d = %.4f\n', i, minors(i));
end
if all(minors > 0)
    disp('Sylvester Criterion Satisfied (All Minors > 0) -> ASYMPTOTICALLY STABLE.');
else
    disp('Sylvester Criterion Violated -> NOT Asymptotically Stable.');
end
