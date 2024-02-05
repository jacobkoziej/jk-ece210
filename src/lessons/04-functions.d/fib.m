function x = fib(n)
    if n <= 1
        x = 1;
        return
    end

    x = fib(n - 1) + fib(n - 2);
end
