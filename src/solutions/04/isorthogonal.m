% SPDX-License-Identifier: GPL-3.0-or-later
%
% isorthogonal.m -- check if two vectors are orthogonal
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

function out = isorthogonal(u, v, ip)
    out = ip(u, v) < eps;
end
