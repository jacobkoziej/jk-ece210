[H, w] = freqz(b, a);

H_dB = 20 * log10(abs(H));
H_ph = rad2deg(unwrap(angle(H)));

f = figure;

subplot(2, 1, 1);
plot(w, H_dB);
title('Magnitude Response');
xlim([0, pi]);
xticks([0, pi / 4, pi / 2, 3 * pi / 4, pi]);
xticklabels({'0', 'pi/4', '\pi/2', '3\pi/4', '\pi'});
xlabel('Frequency [rad]');
ylabel('|H| [dB]');

subplot(2, 1, 2);
plot(w, H_ph);
title('Phase Response');
xlim([0, pi]);
xticks([0, pi / 4, pi / 2, 3 * pi / 4, pi]);
xticklabels({'0', 'pi/4', '\pi/2', '3\pi/4', '\pi'});
xlabel('Frequency [rad]');
ylabel('Phase [deg]');
