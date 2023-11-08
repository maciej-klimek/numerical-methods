function [D] = get_all_minors(A)

    D = NaN(size(A));

    for c=1:size(A,1)
      for r=1:size(A,2)
        D(c,r) = det(A([1:c-1 c+1:end],[1:r-1 r+1:end]));
      end
    end



