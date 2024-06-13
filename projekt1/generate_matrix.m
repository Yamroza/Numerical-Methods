function [A] = generate_matrix(x, degree)
    [~, siz] = size(x);
    A = zeros(siz, degree+1);
    for i = 1:siz
        for j = 1:degree+1
            A(i,j) = x(i)^(degree-j+1);
        end
    end
end