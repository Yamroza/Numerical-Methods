function [L, D] = my_ldl(A)

    n = size(A, 1); % pobranie rozmiaru macierzy A    
    L = eye(n);     % inicjalizacja macierzy dolnej trójkątnej L jako macierzy jednostkowej
    D = zeros(n);   % inicjalizacja macierzy diagonalnej D jako macierzy zerowej
    
    for i = 1:n
        % obliczanie składowych macierzy D
        d = A(i,i);
        for step = 1:i-1
            d = d - L(i,step)^2 * D(step, step);
        end
        D(i,i) = d;
        % obliczanie składowych macierzy L
        for j = i+1:n
            l = A(j, i);
            for step = 1:i-1
                l = l - L(j,step) * D(step, step) * L(i, step);
            end
            L(j, i) = l / D(i, i);
        end
    end
end
