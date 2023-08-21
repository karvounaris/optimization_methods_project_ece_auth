function [y] = Fibonacci_method(x)
    
    if x == 0
        y = 1;
    elseif x == 1
        y = 1;
    else
        y = Fibonacci_method(x - 1) + Fibonacci_method(x - 2);
    end
    
end

