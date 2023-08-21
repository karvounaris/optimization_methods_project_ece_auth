clear all

%constant
l = 0.01;

e = 0.0011;

%array to store the sum of function's usages and the counter
function_usages = [];
counter_function_usages = 0; 

%array to store the values of e
counter_e = [];

%loop to test different values of e
while e < 0.005
    %a_k start
    a_k = -1;
    %b_k start
    b_k = 3;
    
    counter_function_usages = 0;
    %use the Bisector method
    while (b_k - a_k) > l
        [x1_k, x2_k] = Bisector_method(a_k, b_k, e);
        
        if f1(x1_k) < f1(x2_k)
            b_k = x2_k;
        else
            a_k = x1_k;
        end
        counter_function_usages = counter_function_usages + 2;
    end
    function_usages(end + 1) = counter_function_usages;
    counter_e(end + 1) = e;
    e = e + 0.0001;
end

plot(counter_e, function_usages, 'o')
