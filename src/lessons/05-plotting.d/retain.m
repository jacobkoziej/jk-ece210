x = linspace(0, 2 * pi, 1e3);
f = {@sin, @cos, @tan};

figure;
hold on;
for i = 1:numel(f)
    plot(x, f{i}(x));
end
xlabel('x [rad]');
legend('sin(x)', 'cos(x)', 'tan(x)');
xlim([x(1), x(end)]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
xticks([0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
ylim([-2, 2]);
