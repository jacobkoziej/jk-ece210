x = linspace(-10, 10, 100);
y = x;

[X, Y] = meshgrid(x, y);
R = sqrt(X.^2 + Y.^2);

figure;
surf(X, Y, sinc(R));
