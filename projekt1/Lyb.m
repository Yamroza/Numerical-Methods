function y = Lyb(L, b)
    n = size(L, 1);
    y = zeros(n,1);
    for k = 1:n
        elem = b(k,1);
        for j = 1:k-1
            elem = elem - L(k,j)*y(j,1);
        end
        y(k,1) = elem / L(k,k);
    end
end