clc; clear; close all;
A = [0 1 0; 0 0 1; -2 -5 -4];
B = [0; 0; 1];
C = [1 2 0];
D = [0];
n = size(A, 1);
% 1. Controllability Check
Qc = ctrb(A, B);
rank_Qc = rank(Qc);
disp('Controllability Matrix Qc:'); disp(Qc);
if rank_Qc == n
    fprintf('Rank(Qc) = %d == %d -> System is COMPLETELY CONTROLLABLE.\n\n', rank_Qc, n);
else
    fprintf('Rank(Qc) = %d < %d -> System is UNCONTROLLABLE.\n\n', rank_Qc, n);
end
% 2. Observability Check
Qo = obsv(A, C);
rank_Qo = rank(Qo);
disp('Observability Matrix Qo:'); disp(Qo);
if rank_Qo == n
    fprintf('Rank(Qo) = %d == %d -> System is COMPLETELY OBSERVABLE.\n\n', rank_Qo, n);
else
    fprintf('Rank(Qo) = %d < %d -> System is UNOBSERVABLE.\n\n', rank_Qo, n);
end
% 3. Minimal Realization Check
sys = ss(A, B, C, D);
sys_min = minreal(sys);
fprintf('Original states = %d, Minimal realization states = %d\n', size(sys.A,1), size(sys_min.A,1));
