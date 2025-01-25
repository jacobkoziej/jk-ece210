% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 02 solution
% Copyright (C) 2024--2025  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

%% 1
u = -4:2:4;
v = linspace(0, pi, 5);

%% 2
f = prod(2:10);

%% 3
A = zeros(2, 4);
A(1, 1) = 1;
A(2, 3) = 1;

B = reshape(1:16, 2, [])';
B = reshape(B, 4, 4);

%% 4
i = 50;
a_n = (2 .* (0:i) + 1)';

t = linspace(-pi, pi, 1e3);
s = sum(sin(a_n .* t) ./ a_n);

plot(t, s);
