e = subs(d, [a, b], [4, 3])

% we can also substitute with symbolic expressions!
syms y;
z = subs(d, x, y)
