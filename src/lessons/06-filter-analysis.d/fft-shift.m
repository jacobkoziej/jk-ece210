fs = 100;

T = 1 / fs;
l = 200;
t = (0:l - 1) * T;
s = 0.2;
s = s + 0.4 * exp(1j * 2 * pi * 10 * t);
s = s + 0.3 * exp(-1j * 2 * pi * 40 * t);
S = fftshift(fft(s));

f = figure;
plot(fs / l * (-l / 2:l / 2 - 1), S);
ylabel('|S|');
xlabel('f [Hz]');
