% SPDX-License-Identifier: GPL-3.0-or-later
%
% gram_schmidt.m -- Gram Schmidt process
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

function U = gram_schmidt(V, ip, ip_norm)
    [n, k] = size(V);
    U = zeros(n, k);

    U = V(:, 1) / ip_norm(V(:, 1));

    for i = 2:k
        U(:, i) = V(:, i);

        for j = 1:(i - 1)
            U(:, i) = U(:, i) - ip(U(:, j), U(:, i)) * U(:, j);
        end

        U(:, i) = U(:, i) / ip_norm(U(:, i));
    end
end
