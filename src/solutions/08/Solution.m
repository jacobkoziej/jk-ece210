% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 08 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

%% 1
syms I_C I_S V_BE V_T;
syms A_E D_n N_B W_B n_i q;

eqs = [
       I_C == I_S * exp(V_BE / V_T)
       I_S == (A_E * q * D_n * n_i^2) / (N_B * W_B)
      ];

sol = solve(subs(eqs(1), rhs(eqs(2))), A_E);

%% 2
syms C R V_C(t) V_S(t);

V = dsolve(V_S(t) == R * C * diff(V_C(t), t) + V_C(t));

%% 3
mu_0 = vpa(sym(4e-7) * pi, floor(pi * 1e3));
