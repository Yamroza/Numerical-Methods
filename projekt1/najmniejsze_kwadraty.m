% dane wyjściowe
x = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
y = [-42.417 -23.440 -11.160 -4.128 -0.725 0.942 -2.069 -3.908 -4.705 -5.438 -3.578];
degrees = [3, 5, 7, 9, 10]; % stopnie wielomianów
x_multi = -10:0.2:10;       % punkty do sprawdzenia wyników

for degree = degrees
    A = generate_matrix(x, degree);
    % aproksymacja z układem równań normalnych
    a1 = uklad_rownan(A, y);
    y1 = polyval(a1, x_multi);
    % aproksymacja z rozkładem SVD
    a2 = svd_rozwiazanie(A, y, degree);
    y2 = polyval(a2, x_multi);

    % błędy
    e1_2 = norm(A*a1-y', 2);
    e1_inf = norm(A*a1-y', inf);
    e2_2 = norm(A*a2-y', 2);
    e2_inf = norm(A*a2-y', inf);
    
    % wykresy
    plot(x_multi, y1, 'r-','LineWidth', 3 );
    hold on;
    plot(x_multi, y2, 'g--', 'LineWidth', 3 );
    hold on;
    plot(x, y, 'b*', 'LineWidth', 5);
    hold off;
    legend('Układ równań', 'SVD', 'Punkty domyślne');
    title("Aproksymacja metodą najmniejszych kwadratów z wielomianem stopnia " + degree);
end
