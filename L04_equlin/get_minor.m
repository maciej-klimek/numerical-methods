function minor_value = get_minor(A, c, r)
    minor_value = det(A([1:c-1 c+1:end],[1:r-1 r+1:end]));
end