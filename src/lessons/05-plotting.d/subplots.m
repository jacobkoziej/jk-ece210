t = linspace(-10, 10, 1000);
n = -10:10;

f = figure;

subplot(2, 1, 1);
plot(t, sinc(t));
title('sinc(t)');

subplot(2, 1, 2);
stem(n, sinc(n), 'filled');
title('sinc[n]');
