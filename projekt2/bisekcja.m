function [xf, ff, iter] = bisekcja(funkcja, a, b, delta, imax)
%
%   CEL
%       Poszukiwanie pierwiastka funkcji jednej zmiennej
%       metoda bisekcji
%  
%   PARAMETRY WEJSCIOWE
%       f      -  funkcja dana jako wyrazenie  
%       a      -  początek przedziału
%       b      -  koniec przedziału
%       delta  -  dokladnosc
%       imax   -  maksymalna liczba iteracji
%
%   PARAMETRY WYJSCIOWE
%       xf     -  rozwiazanie 
%       ff     -  wartosc funkcji w xf
%       iter   -  liczba wykonanych iteracji
%
%   PRZYKLADOWE WYWOLANIE
%       >> [xf, ff, iter] = bisekcja(@(x) funkcja(x), -5, 5, 33*eps, 100)
%
    c = (a + b) / 2;                    % wyznaczenie środka przedziału dla 1 iteracji
    fc = funkcja(c);                    % wyznaczenie wartości funkcji dla 1 iteracji
    iter = 0;
    while (abs(fc) > delta && iter < imax) % sprawdzenie warunku stopu
        iter = iter + 1;
        if (funkcja(a) * fc < 0)        % obliczenie iloczynu f(a) * f(c), sprawdzenie czy ujemny
            b = c;                      % przypisanie c na nowy koniec przedziału
        else
            a = c;                      % przypisanie c na nowy początek przedziału
        end
        c = (a + b) / 2;                % wyznaczenie nowego środka przedziału
        fc = funkcja(c);                % obliczenie wartości funkcji dla środka przedziału
    end
xf = c;
ff = funkcja(xf);
end
