% SPDX-License-Identifier: GPL-3.0-or-later
%
% gen.m -- generate figures
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

out = @(fig, file) exportgraphics(fig, file, 'ContentType', 'vector');

A = imread('original.jpg');
B = rgb2gray(A);

imwrite(B, 'grayscale.jpg');

B_fft = fftshift(fft2(B));
B_abs = abs(B_fft);

f = figure;
imshow( ...
       log10(B_abs) ./ log10(max(B_abs, [], 'all')), ...
       'Interpolation', ...
       'bilinear');

out(f, 'gray-fft2.eps');
