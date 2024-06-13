ns = [5, 25, 50, 100, 250, 500, 1000];
[elems, ~] = size(ns);

% inicjalizacja wektorów do zapisu wyników
times_my = zeros(elems,1);
epsilons_my = zeros(elems,1);
times_gs = zeros(elems,1);
epsilons_gs = zeros(elems,1);

index = 0;
for n = ns
    index = index + 1;
    % inicjalizacja macierzy A oraz wektora b
    A = zeros(n);
    b = zeros(n,1);

    for i = 1:n
        b(i) = 4.5 + 0.5*i;         % uzupełnienie wektora b       
        for j = 1:n                 % uzupełnienie macierzy A
            if i == j
                A(i,j) = 12;
            elseif abs(i-j) <=3 
                A(i,j) = 3.8;
            else
                A(i,j) = 0;
            end
        end
    end
    tic;                            % rozpoczęcie pomiaru czasu
    [x, e] = LDLT(A, b);            % znalezienie rozwiązania
    times_my(index) = toc;          % pomiar czasu
    epsilons_my(index) = e;

    [xf, iexe, texe]=GS(A,b,1e-9, 1000*n);  % znalezienie rozwiązania inną metodą
    times_gs(index) = texe;                 % zapis czasu
    blad = norm(A*xf-b);
    epsilons_gs(index) = blad;              % zapis błędu
end

% narysowanie wykresów
plot(ns, epsilons_my, 'b-', 'LineWidth', 2);
hold on;
plot(ns, epsilons_gs, 'r-', 'LineWidth', 2);
hold off;

xlabel('n');
ylabel('czas');
title('Czas wykonania');
legend('Mój solwer', 'GS solwer');
