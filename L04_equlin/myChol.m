function [L,LT] = myChol(A);

[N, N] = size(A);

L = zeros(N, N);
for i = 1:N
    sum1 = 0;
    for j = 1:i-1
        sum1 = sum1 + L(i,j)^2;
    end
    L(i, i) = sqrt(A(i, i)-sum1);

    for k = i+1:N
        sum2 = 0;
        for j = 1:i-1
            sum2 = sum2 + L(k,j) * L(i,j);
        end
            L(k,i) = (A(k,i) - sum2) / L(i,i);
    end
end
LT = L';

