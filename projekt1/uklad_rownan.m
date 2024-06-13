function a = uklad_rownan(A, y)
    Gram = A'*A;            % macierz Grama
    wekt = A' * y';         % wektor wynikowy
    a = LDLT(Gram, wekt);   % wektor współczynników a
end