function [x, epsilon] = LDLT(A, b)
    [L, D] = my_ldl(A);
    % Rozwiązanie Ly = b
    % L - macierz dolna trójkątna
    y = Lyb(L,b);
    % Rozwiązanie DLTx = y
    % DLT - macierz górna trójkątna
    x = xDLTy(D*L', y);
    % Obliczenie błędu rozwiązania epsilon
    epsilon = norm(A*x-b, 2);
end