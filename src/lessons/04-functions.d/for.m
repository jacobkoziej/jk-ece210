factorial = 1;

for i = 1:10
    if i == 1
        continue
    end

    if i == 9
        break
    end

    factorial = factorial * i;
end
