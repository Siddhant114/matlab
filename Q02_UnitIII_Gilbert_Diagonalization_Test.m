clc; clear; close all;
A = [-2 1; 0 -3];
B = [1; 0];
C = [1 1];
[P, Lambda] = eig(A);
B_tilde = inv(P) * B;
C_tilde = C * P;
disp('Diagonal Matrix Lambda:'); disp(Lambda);
disp('Transformed Input Matrix B_tilde:'); disp(B_tilde);
disp('Transformed Output Matrix C_tilde:'); disp(C_tilde);
if any(all(abs(B_tilde) < 1e-10, 2))
    disp('Gilbert Test: B_tilde has a zero row -> System is UNCONTROLLABLE.');
else
    disp('Gilbert Test: No zero rows in B_tilde -> System is CONTROLLABLE.');
end
if any(all(abs(C_tilde) < 1e-10, 1))
    disp('Gilbert Test: C_tilde has a zero column -> System is UNOBSERVABLE.');
else
    disp('Gilbert Test: No zero columns in C_tilde -> System is OBSERVABLE.');
end
