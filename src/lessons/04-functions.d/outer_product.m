function [sz, A] = outer_product(u, v)
    A = u' * v;
    sz = size(A);
end
