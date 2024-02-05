try
    a = always_fails(3);
catch
    warning('Problem using function, assigning a value of 0.');
    a = 0;
end
