% SPDX-License-Identifier: GPL-3.0-or-later
%
% gen.m -- generate figures
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

A = imread('original.jpg');
B = rgb2gray(A);

imwrite(B, 'grayscale.jpg');
