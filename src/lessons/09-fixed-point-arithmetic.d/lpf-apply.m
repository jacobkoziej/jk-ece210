s_filtered = LPF(fi(s, T));

figure;
plot(t, s_filtered);
title('"Filtered" Data');
xlabel('Time [s]');
