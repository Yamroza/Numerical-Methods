function [pierwiastki, wartosci] = MM1_solver(as)
%
%   CEL
%       Poszukiwanie pierwiastków wielomianu metodą Mullera MM1
%  
%   PARAMETRY WEJSCIOWE
%       as     - współczynniki wielomianu  
%
%   PARAMETRY WYJSCIOWE
%       pierwiastki - rozwiązania
%       wartosci    - wartosci wielomianu rozwiązań
%
%   PRZYKLADOWE WYWOLANIE
%       >> [pierwiastki, wartosci] = MM1_solver([1, -8, 15])
%
    as_in = as;                 % zapisanie wejściowych współczynników
    
    n = length(as) - 1;         % obliczenie stopnia wielomianu
    pierwiastki = zeros(n, 1);  % inicjalizacja wektora rozwiązań
    wartosci = zeros(n, 1);     % inicjalizacja wektora wartości
    
    x = [0,1,2];
    delta = 1e-8;

    for i = 1:n - 1
        pierwiastki(i) = MM1(as, x, delta);
        as = deflacja(as, pierwiastki(i));
        wartosci(i) = abs(polyval(as_in, pierwiastki(i)));
    end

    % obliczamy ostatni pierwiastek
    pierwiastki(n) = - as(2) / as(1);
    wartosci(n) = abs(polyval(as_in, pierwiastki(n)));
end


