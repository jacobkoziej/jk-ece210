% SPDX-License-Identifier: GPL-3.0-or-later
%
% Solution.m -- Assignment 07 solution
% Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

clc;
clear;
close all;

%% 1
FILE = fullfile( ...
                "..", ...
                "..", ...
                "assignments", ...
                "07-under-pressure.d", ...
                "40p_1000ms.csv");

RESOLUTION = 2^12;

fs = 80e3;
fn = fs / 2;

M = readmatrix(FILE);

t = M(:, 1) ./ fs;
s = M(:, 2) ./ (RESOLUTION - 1);

%% 2
S = fft(s);
S = S(1:floor(end / 2));
w = linspace(0, pi, numel(S));
f = (w * fs) / (2 * pi);

mask = f >= 5;
S = S(mask);
f = f(mask);

S_dB = 20 * log10(abs(S));
dB_max = max(S_dB);

elements = f <= 40;

%% 3
Wp = 10 / fn;
Ws = 20 / fn;
Rp = 0.1;
Rs = 40;

[n, Wn] = ellipord(Wp, Ws, Rp, Rs);
[z, p, k] = ellip(n, Rp, Rs, Wp);

%% 4
[sos, g] = zp2sos(z, p, k);

f_response = linspace(0, Ws * fn + 20, 1e3);
h = g * freqz(sos, f_response, fs);
h_dB = 20 * log10(abs(h));

%% 5
s_filtered = g * sosfilt(sos, s);

%% plots
figure;
figure_title = {
                'Brake Pressure Data w/ No Hardware Filter '
                '(fs = 80kHz, 12-bit Resolution, Normalized)\n'
                '40%% Pressure w/ Hydrastar, 10ms Delayed Start, 1000ms Hold'
               };
sgtitle(sprintf(strjoin(figure_title)));

subplot(2, 2, 1);
plot(t, s);
ylim([0.3, 0.9]);
title('Raw Data');
xlabel('Time [s]');

subplot(2, 2, 2);
plot(f(elements), S_dB(elements));
yline(dB_max - 20, '--', '-20dB');
yline(dB_max - 40, '--', '-40dB');
title('Raw Data FFT');
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');

subplot(2, 2, 3);
plot(f_response, h_dB);
xline(Wp * fn, '--', 'Passband');
xline(Ws * fn, '--', 'Stopband');
xlim(f_response([1, end]));
yline(-Rp, '--', 'Passband');
yline(-Rs, '--', 'Stopband');
ylim([-Rs - 10, 15]);
title(sprintf('Elliptic Lowpass Filter (n = %d)', n));
xlabel('Frequency [Hz]');
ylabel('|H| [dB]');

subplot(2, 2, 4);
plot(t, s_filtered);
yline(0.51, '--', 'DC Bias');
ylim([0.3, 0.9]);
title('Filtered Data');
xlabel('Time [s]');
