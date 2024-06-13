% wykres funkcji f
% fplot(@(x) foo(x), [-8 10], 'm', 'LineWidth', 3);
% yline(0,'k--','LineWidth', 3);
% title('Funkcja wyjściowa');

% zdefiniowanie przedziałów izolacji pierwiastków
[as, bs] = przedzialy_izolacji(@(x) foo(x), -8, 10, 0.1);
no = length(as);

% inicjalizacja wektorów wynikowych
xfs_bi = []; ffs_bi = []; its_bi = [];
xfs_ne = []; ffs_ne = []; its_ne = [];
% metoda bisekcji
for n = 1:no
    [xf, ff, imax ] = bisekcja(@(x) foo(x), as(n), bs(no), 33*eps, 100);
    xfs_bi = [xfs_bi, xf]; ffs_bi = [ffs_bi, ff]; its_bi = [its_bi, imax];
end
% metoda Newtona
[xf, ff, imax, ~] = newton(@(x) foo(x), -8, 33*eps, 100);
xfs_ne = [xfs_ne, xf]; ffs_ne = [ffs_ne, ff]; its_ne = [its_ne, imax];
[xf, ff, imax, ~] = newton(@(x) foo(x), -2.5, 33*eps, 100);
xfs_ne = [xfs_ne, xf]; ffs_ne = [ffs_ne, ff]; its_ne = [its_ne, imax];

fplot(@(x) foo(x), [-6 2], 'm', 'LineWidth', 2);
yline(0,'k--','LineWidth', 2);
hold on;
plot(xfs_bi, ffs_bi, 'r*', 'LineWidth', 6);
hold on;
plot(xfs_ne, ffs_ne, 'b*', 'LineWidth', 6);
hold off;
title('Punkty zerowe');
legend('Funkcja f', 'Zero', 'Metoda bisekcji', 'Metoda Newtona')
