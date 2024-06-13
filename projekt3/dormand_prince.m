function [t, y, hs, es] = dormand_prince(func, tspan, y0, h_start, h_min, wb, beta, ew, eb)

    y(:, 1) = y0;       % ustalanie wartosci poczatkowych
    t = tspan(1);       % poczatek przedzialu
    h = h_start;        % krok poczatkowy
    s = wb;             % wspolczynnik bezpieczenstwa
    i = 2;              % iteracja
    es(1) = 0;
    hs(1) = 0;

    % tablica butchera
    c = [0, 1/5, 3/10, 4/5, 8/9, 1, 1];
    
    a = [0          0          0           0        0           0;
        1/5         0          0           0        0           0;
        3/40        9/40       0           0        0           0;
        44/45      -56/15      32/9        0        0           0;
        19372/6561 -25360/2187 64448/6561 -212/729  0           0;
        9017/3168  -355/33     46732/5247  49/176  -5103/18656  0;
        35/384      0          500/1113    125/192 -2187/6784   11/84];

    w_star = [35/384     0 500/1113   125/192 -2187/6784    11/84    0   ];
    w      = [5179/57600 0 7571/16695 393/640 -92097/339200 197/2100 1/40];


    while 1
        % aproksymacja wartości funkcji w poprzednim punkcie
        yn = y(:, i - 1);
        % czas
        tn = t(i-1);
        k = zeros(2, 7);
        for j = 1:7
            sec_arg = yn + [dot(a(j, :) , k(1,1:6)); dot(a(j,:), k(2,1:6))];
            k(:, j) = h * func(tn+c(j), sec_arg);
        end
    
        % obliczanie wartosci funkcji w kolejnym punkcie dla rzedu p
        p = yn + [dot(w_star , k(1,:)); dot(w_star, k(2,:))];
        % obliczanie wartosci funkcji w kolejnym punkcie dla rzedu p+1
        p1 = yn + [dot(w , k(1,:)); dot(w, k(2,:))];

        delta = abs(p - p1);            % oszacowanie bledu
        e = abs(yn) * ew + eb;          % parametr dokladnosci obliczen
        alfa = (e./delta).^(1/5);       % wspolczynnik modyfikacji kroku
        alfa = min([alfa(1) alfa(2)]);
        h_new = s * alfa * h;           % nowa wartosc kroku
        y(:,i) = p1;                    % zapisanie nowej wartosci funkcji

        if (s * alfa >= 1)
            if (tn + h >= tspan(2))
                % koniec
                y = y(:,1:end-1);
                hs = hs(1:end-1);
                es = es(1:end-1);
                break
            else
                t(i) = t(i-1) + h;      % przesuniecie w czasie
                % wyznaczenie nowej wartosci kroku
                h_new = min([h_new beta*h tspan(2)-t(i-1)]);
                i = i+1;
                h = h_new;
                hs(i) = h;
                es(i) = e(1);
            end
        else
            if (h_new < h_min)
                error('Niemozliwe rozwiazanie z zadana dokladnoscia');
            else
                % powtorzenie iteracji z nowa wartoscia kroku
                h = h_new;
            end
        end
    end
end

