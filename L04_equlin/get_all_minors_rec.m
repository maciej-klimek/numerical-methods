function Df = get_all_minors_rec(A, D, i, j)
    [r, c] = size(A);

    minor = get_minor(A, i, j);
    D(j, i) = (-1)^(i+j) * minor;
    
    if(i >= r && j >= c)
        Df = D;
    elseif(j >= c)
        Df = get_all_minors_rec(A, D, i+1, 1);
    else
        Df = get_all_minors_rec(A, D, i, j+1);
    end
end

