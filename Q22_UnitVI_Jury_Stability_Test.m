clc; clear; close all;
P = [1, -1.2, 0.45, -0.05];
n = length(P) - 1;
P_1 = polyval(P, 1);
P_neg1 = ((-1)^n) * polyval(P, -1);
cond1 = P_1 > 0;
cond2 = P_neg1 > 0;
cond3 = abs(P(end)) < P(1);
a3 = P(1); a2 = P(2); a1 = P(3); a0 = P(4);
b2 = det([a0 a3; a3 a0]);
b1 = det([a0 a2; a3 a1]);
b0 = det([a0 a1; a3 a2]);
cond4 = abs(b2) > abs(b0);
fprintf('P(1) = %.4f (>0: %d)\n', P_1, cond1);
fprintf('(-1)^n P(-1) = %.4f (>0: %d)\n', P_neg1, cond2);
fprintf('|a0| < a3: %d\n', cond3);
fprintf('|b2| > |b0| (%.4f > %.4f): %d\n', abs(b2), abs(b0), cond4);
if cond1 && cond2 && cond3 && cond4
    disp('CONCLUSION: All Jury conditions satisfied -> System is STABLE.');
else
    disp('CONCLUSION: Jury conditions violated -> System is UNSTABLE.');
end
r = roots(P);
disp('Closed-loop roots and magnitudes:'); disp([r, abs(r)]);
