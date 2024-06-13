ns = [5, 25, 50, 100, 250, 500, 1000];
[elems, ~] = size(ns);
% inicjalizacja wektorów do zapisu wyników
times = zeros(elems,1);
epsilons = zeros(elems,1);
index = 0;

for n = ns
    index = index + 1;
    % inicjalizacja macierzy A oraz wektora b
    A = zeros(n);
    b = zeros(n,1);

    for i = 1:n
        b(i) = 2.5 + 0.6*i;     % uzupełnienie wektora b
        for j = 1:n             % uzupełnienie macierzy A
            if i == j
                A(i,j) = 4*n^2+(3*i+2)*n;
            else
                A(i,j) = 2*(i+j) + 1;
            end
        end
    end
    tic;                        % rozpoczęcie pomiaru czasu
    [x, e] = LDLT(A, b);        % znalezienie rozwiązania
    times(index) = toc;         % pomiar czasu
    epsilons(index) = e;        
end

% rysowanie wykresów
% plot(ns, epsilons)
% plot(ns, times)