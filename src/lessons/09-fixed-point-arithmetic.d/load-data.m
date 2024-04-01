RESOLUTION = 2^12;

fs = 80e3;

M = readmatrix("40p_1000ms.csv");

t = M(:, 1) ./ fs;
s = M(:, 2) ./ (RESOLUTION - 1);
