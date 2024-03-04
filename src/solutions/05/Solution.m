% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 05 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

%% 1
i = 50;
a_n = (2 .* (0:i) + 1);

t = linspace(-pi, pi, 1e3)';
s = sin(a_n .* t) ./ a_n;

sq = sum(s, 2);

figure;
hold on;

plot(t, sq);
for i = 1:size(s, 2)
    plot(t, s(:, i));
end

title('Fourier Series Approximation of a Square Wave');
xlabel('t');
xlim([t(1), t(end)]);
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'});
xticks([-pi, -pi / 2, 0, pi / 2, pi]);
ylim([-1, 1]);

%% 2
figure;
sgtitle('Fourier Series Approximation of a Square Wave');

subplot(1, 2, 1);
plot(t, sq);

title('Approximation');
xlabel('t');
xlim([t(1), t(end)]);
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'});
xticks([-pi, -pi / 2, 0, pi / 2, pi]);
ylim([-1, 1]);

subplot(1, 2, 2);
hold on;

for i = 1:size(s, 2)
    plot(t, s(:, i));
end

title('Componenents');
xlabel('t');
xlim([t(1), t(end)]);
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'});
xticks([-pi, -pi / 2, 0, pi / 2, pi]);
ylim([-1, 1]);

%% 3
n = 64;
x = linspace(-2 * pi, 2 * pi, 64);
y = linspace(-2 * pi, 2 * pi, 64);

[X, Y] = meshgrid(x, y);

Z = X .* sin(X) - Y .* cos(Y);

figure;
surf(X, Y, Z);
