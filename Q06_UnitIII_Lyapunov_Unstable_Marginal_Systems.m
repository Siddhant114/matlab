clc; clear; close all;
A_cells = {[-2 1; -1 -2], [0 1; -4 0], [1 2; 0 -3]};
names = {'System 1 (A1)', 'System 2 (A2)', 'System 3 (A3)'};
Q = eye(2);
for i = 1:3
    A = A_cells{i};
    fprintf('--- Analyzing %s ---\n', names{i});
    try
        P = lyap(A', Q);
        eP = eig(P);
        fprintf('Eigenvalues of P: [%.4f, %.4f]\n', eP(1), eP(2));
        if all(eP > 0)
            disp('Result: P > 0 -> ASYMPTOTICALLY STABLE.');
        else
            disp('Result: P is NOT positive definite -> UNSTABLE.');
        end
    catch ME
        disp('Result: lyap() failed (singular/marginally stable) -> NOT ASYMPTOTICALLY STABLE.');
    end
    ev = eig(A);   % (MATLAB does not allow eig(A)(1), so store first)
    fprintf('Actual Eigenvalues of A: [%.2f%+.2fi, %.2f%+.2fi]\n\n', ...
        real(ev(1)), imag(ev(1)), real(ev(2)), imag(ev(2)));
end
