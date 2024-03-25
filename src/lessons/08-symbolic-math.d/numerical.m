x = log(1e32)

f = @(t) 1 ./ t;
y = integral(f, 1, 1e32)
