clc; clear; close all;
A = [-1 1 0; 0 -2 0; 0 0 -3];
B = [0; 1; 1];
C = [1 0 0];
n = size(A, 1);
% Manual Construction
Qc_man = zeros(n, n);
Qo_man = zeros(n, n);
for k = 0:n-1
    Qc_man(:, k+1) = (A^k) * B;
    Qo_man(k+1, :) = C * (A^k);
end
% Cross-verify with built-in functions
fprintf('Max error in Qc: %e\n', max(max(abs(Qc_man - ctrb(A,B)))));
fprintf('Max error in Qo: %e\n', max(max(abs(Qo_man - obsv(A,C)))));
fprintf('Rank(Qc) = %d, Rank(Qo) = %d\n', rank(Qc_man), rank(Qo_man));
% Staircase Decomposition to find uncontrollable eigenvalue
[Abar, Bbar, Cbar, T, k_states] = ctrbf(A, B, C);
uncontrolled_eig = eig(Abar(1:n-sum(k_states), 1:n-sum(k_states)));
fprintf('Uncontrollable Mode Eigenvalue: %.2f\n', uncontrolled_eig);
