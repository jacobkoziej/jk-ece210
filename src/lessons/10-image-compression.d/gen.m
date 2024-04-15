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

B_abs_sort = sort(B_abs(:));

for drop = [0.0000, 0.9000, 0.9900, 0.9950, 0.9975, 0.9990]
    threshold = B_abs_sort(floor(numel(B_abs_sort) * drop) + 1);
    mask = B_abs >= threshold;

    compressed = uint8(ifft2(ifftshift(B_fft .* mask)));
    imwrite(compressed, sprintf('%1.4f.jpg', drop));
end
