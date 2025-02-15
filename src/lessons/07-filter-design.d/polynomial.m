l = 1e6;
s = randn(1, l);
S = fftshift(fft(s));

s_filt = filter(b, a, s);
S_filt = fftshift(fft(s_filt));

figure;

subplot(2, 1, 1);
plot(fs / l * (-l / 2:l / 2 - 1), 20 * log10(abs(S)));
title('Unfiltered');
ylabel('|S| [dB]');
xlim([-1, 1] * fn);
xlabel('f [Hz]');

subplot(2, 1, 2);
plot(fs / l * (-l / 2:l / 2 - 1), 20 * log10(abs(S_filt)));
title('Filtered');
ylabel('|S| [dB]');
xlim([-1, 1] * fn);
xlabel('f [Hz]');
