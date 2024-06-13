function [pierwiastek] = MM1(as, xs, delta)
%
%   CEL
%       Poszukiwanie pierwiastka wielomianu metodą Müllera MM1
%  
%   PARAMETRY WEJSCIOWE
%       as      -  wektor współczynników wielomianu, od najbardziej znaczącego
%       xs      -  wektor punktów x0, x1, x2
%       delta   -  dokladnosc
%
%   PARAMETRY WYJSCIOWE
%       pierwiastek -  rozwiazanie 
%
%   PRZYKLADOWE WYWOLANIE
%       >> pierwiastek = MM1([4,3,2,1] ,[0,1,2] , 1e-8)
%
    while abs(polyval(as, xs(3))) > delta
        % obliczenie wartości funkcji dla x0, x1 i x2
        f1 = polyval(as, xs(1));
        f2 = polyval(as, xs(2));
        f3 = polyval(as, xs(3));
        % zmienne przyrostowe
        z1 = xs(1) - xs(3);
        z2 = xs(2) - xs(3);
        % obliczenie współczynników a i b - wartości f(x0)-f(x2) oraz f(x1)-f(x2)
        r1 = f1 - f3;
        r2 = f2 - f3;
        % rozwiązanie układu równań
        a = (r1 * z2 - r2 * z1) / (z1*z2*(z1 - z2));
        b = (r2 * z1^2 - r1 * z2^2) / (z1*z2*(z1 - z2));
        c = f3;
        % obliczenie miejsc zerowych paraboli
        z_plus = (-2*c) / (b + sqrt(b^2 - 4*a*c));
        z_minus = (-2*c) / (b - sqrt(b^2 - 4*a*c));
        % wybranie nowego przybliżenia rozwiązania
        if abs(b + sqrt(b^2 - 4*a*c)) >= abs(b - sqrt(b^2 - 4*a*c))
            x_new = xs(3) + z_plus;
        else
            x_new = xs(3) + z_minus;
        end
        % wybranie x najbardziej oddalonego od nowego przybliżenia
        out_x = 1;  % indeks x najbardziej oddalonego
        delta_x = abs(x_new - xs(1));
        if abs(x_new - xs(2)) > delta_x
            delta_x = abs(x_new - xs(2));
            out_x = 2;
        end
        if abs(x_new - xs(3)) > delta_x
            out_x = 3;
        end
        % nowy wektor x
        xs(out_x) = [];
        xs = [xs, x_new];
    end
    pierwiastek = xs(3);
end
