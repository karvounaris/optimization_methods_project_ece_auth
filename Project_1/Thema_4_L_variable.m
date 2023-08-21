clear all

syms x
f1 = power(x - 2, 2) + x * log(x + 3);
f2 = power(5, x) + power(2 - cos(x), 2);
f3 = exp(x) * (power(3, x) - 1) + (x - 1) * sin(x);

%not constant
l = 0.005;

%array to store the sum of function's usages and the counter
function_usages = [];
counter_function_usages = 0; 

%array to store the values of l
counter_l = [];

diff_function = diff(f3);

%loop to test different values of l
while l < 0.125
    %a_k start
    a_k = -1;
    %b_k start
    b_k = 3;
    
    counter_function_usages = 0;
    %use the Bisector method
    while (b_k - a_k) > l
        x_k = Bisector_derivative_method(a_k, b_k);
        
        value_of_diff_function = vpa(subs(diff_function, x, x_k));
        
        if value_of_diff_function == 0
            break            
        elseif value_of_diff_function > 0
            b_k = x_k;
        elseif value_of_diff_function < 0    
            a_k = x_k;
        end
        counter_function_usages = counter_function_usages + 1;
    end
    function_usages(end + 1) = counter_function_usages;
    counter_l(end + 1) = l;
    l = l + 0.002;
end

plot(counter_l, function_usages, 'o')
