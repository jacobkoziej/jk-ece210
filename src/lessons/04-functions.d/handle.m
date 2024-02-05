trig = {@sin, @cos, @tan};

x = pi / 6;
y = zeros(1, numel(trig));

for i = 1:numel(trig)
    y(i) = trig{i}(x);
end

display(y);
