function x = xDLTy(DLT, y)
    n = size(DLT, 1);
    x = zeros(n,1);
    for k = n:-1:1
        elem = y(k,1);
        for j = k+1:n
            elem = elem - DLT(k,j)*x(j,1);
        end
        x(k,1) = elem / DLT(k,k);
    end
end