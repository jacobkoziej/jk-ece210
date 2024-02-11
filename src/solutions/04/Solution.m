% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 04 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

%% 1
ip = @(u, v) u' * v;
ip_norm = @(v) sqrt(ip(v, v));

%% 3
S = [
     1, 2 + 3j, -1 + 7j
     1j, 3j, 6 + 10j
     2 - 1j, 1 - 1j, 11 - 4j
     -1, 2j, 3 + 4j
    ];

U = gram_schmidt(S, ip, ip_norm);

orthogonal = ...
    isorthogonal(U(:, 1), U(:, 2), ip) & ...
    isorthogonal(U(:, 1), U(:, 3), ip) & ...
    isorthogonal(U(:, 2), U(:, 3), ip);
