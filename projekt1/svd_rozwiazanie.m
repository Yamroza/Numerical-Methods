function a = svd_rozwiazanie(A, y, degree)
[U,S,V] = svd(A);           % rozkład SVD
s_plus = nonzeros(S);       % wybranie niezerowych wartości szczególnych
y_tilde = U' * y';          % obliczenie wektora y z daszkiem
a_tilde = zeros(degree+1, 1);       % inicjalizacja wektora a z daszkiem
for n = 1:length(s_plus);              % obliczenie wartości wektora a z daszkiem
    a_tilde(n) = y_tilde(n) / s_plus(n);
end
a = linsolve(V', a_tilde);       % wektor współczynników a
end