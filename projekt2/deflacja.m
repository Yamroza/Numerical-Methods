function q = deflacja(as, pierwiastek)
%
%   CEL
%       Deflacja czynnikiem liniowym za pomocą schematu Hornera
%  
%   PARAMETRY WEJSCIOWE
%       as          - wektor współczynników
%       pierwiastek - znaleziony pierwiastek
%
%   PARAMETRY WYJSCIOWE
%       q           -  nowy wektor współczynników
%
%   PRZYKLADOWE WYWOLANIE
%       >> q = deflacja([1,-8,15], 5)
%
    n = length(as);         % pobranie aktualnej długości wektora współczynników
    k = floor(n/2);         % wyznaczenie granicy między prostym a odwotnym schematem
    q = zeros(1, n-1);      % inicjalizacja nowego wektora współczynników    
    
    % Schemat prosty
    i = 1;
    while(i < k)
        if (i == 1)
            q(i) = as(i);
        else
            q(i) = as(i) + q(i - 1) * pierwiastek;
        end
        i = i + 1;
    end
    % Schemat odwrotny
    j = n;
    while (j >= k + 1)
        if (j ==n)
            q(j - 1) = -as(j) / pierwiastek;
        else
            q(j - 1) = (q(j) - as(j)) / pierwiastek;
        end
        j = j - 1;
    end
end

