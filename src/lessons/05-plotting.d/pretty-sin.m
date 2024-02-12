x = linspace(0, 2 * pi, 1e3);
y = sin(x);

figure;
plot(x, y);
title('sin(x)');
xlabel('x [rad]');
xlim([x(1), x(end)]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
xticks([0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
ylabel('y');
