function [as, bs] = przedzialy_izolacji(f, a, b, interval)
%
%   CEL
%       Poszukiwanie przedziałów izolacji pierwiastków funkcji f
%  
%   PARAMETRY WEJSCIOWE
%       f        -  funkcja dana jako wyrazenie  
%       a        -  początek przedziału
%       b        -  koniec przedziału
%       interval -  interwał między kolejnymi punktami
%
%   PARAMETRY WYJSCIOWE
%       as     -  początki przedziałów izolacji
%       bs     -  końce przedziałów izolacji
%
%   PRZYKLADOWE WYWOLANIE
%       >> [as, bs] = przedzialy_izolacji(@(x) funkcja(x), -5, 5, 0.1)
%
    starting_point = a;
    curr_point = a;
    as = [];
    bs = [];
    while curr_point < b
        if foo(starting_point) * f(curr_point) < 0
            as = [as, starting_point];
            bs = [bs, curr_point];
            starting_point = curr_point;
        end
        curr_point = curr_point + interval;
    end
end