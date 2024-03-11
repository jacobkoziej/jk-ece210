% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 06 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

fs = 96e3;

%% 1
db2mag = @(x) 10.^(x / 20);

%% 2
T = 1 / fs;
l = 192e3;
t = (0:l - 1) * T;

f = [-20.48e3; -360; 996; 19.84e3];
a = db2mag([14; -10; 0; 2]);

s = sum(a .* exp(1j * 2 * pi * f .* t));
s = s + db2mag(-10) * randn(size(s));

S = fftshift(fft(s));

figure;
plot(fs / l * (-l / 2:l / 2 - 1), 20 * log10(abs(S)));
xlim([-fs, fs] / 2);
xlabel('f [Hz]');
ylabel('|S| [dB]');

%% 3
z = [
     0.76 + 0.64j
     0.69 + 0.71j
     0.82 + 0.57j
    ];
z = [z; conj(z)];

p = [
     0.57 + 0.78j
     0.85 + 0.48j
    ];
p = [
     p
     conj(p)
     0.24
     0.64
    ];

k = 0.53;

figure;
zplane(z, p);

[b, a] = zp2tf(z, p, k);

f = linspace(0, fs / 2, 1e3);
H = freqz(b, a, f, fs);

H_dB = 20 * log10(abs(H));
H_ph = rad2deg(unwrap(angle(H)));

figure;
sgtitle('Response of H');

subplot(2, 1, 1);
plot(f, H_dB);
title('Magnitude Response');
xlim([0, max(f)]);
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');

subplot(2, 1, 2);
plot(f, H_ph);
title('Phase Response');
xlim([0, max(f)]);
xlabel('Frequency [Hz]');
ylabel('Phase [deg]');
