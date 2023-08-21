clear all

%not constant
l = 0.005;

%constant
e = 0.001;

%array to store the sum of function's usages and the counter
function_usages = [];
counter_function_usages = 0; 

%array to store the values of l
counter_l = [];

%loop to test different values of l
while l < 0.1
    %a_k start
    a_k = -1;
    %b_k start
    b_k = 3;
    
    counter_function_usages = 0;
    %use the Bisector method
    while (b_k - a_k) > l
        [x1_k, x2_k] = Bisector_method(a_k, b_k, e);
        
        if f3(x1_k) < f3(x2_k)
            b_k = x2_k;
        else
            a_k = x1_k;
        end
        counter_function_usages = counter_function_usages + 2;
    end
    function_usages(end + 1) = counter_function_usages;
    counter_l(end + 1) = l;
    l = l + 0.002;
end

plot(counter_l, function_usages, 'o')
