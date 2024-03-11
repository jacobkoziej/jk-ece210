[b, a] = zp2tf(z, p, k);

figure;
freqz(b, a, 1e3);
