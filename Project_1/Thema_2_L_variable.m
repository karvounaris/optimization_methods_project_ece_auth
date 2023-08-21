clear all

%initialazation, not constant
l = 0.001;

%constant
gamma = 0.618;

%array to store the sum of function's usages and the counter
function_usages = [];
counter_function_usages = 0; 

%array to store the values of l
counter_l = [];

%loop to test different values of l
while l < 0.13
    %a_k start
    a_k = -1;
    %b_k start
    b_k = 3;
    
    %first calculation of the limits
    [x1_k, x2_k] = Golden_area(a_k, b_k);
    
    %store the value of the function
    value_of_function_argument_x1 = f3(x1_k);
    value_of_function_argument_x2 = f3(x2_k);
    
    %store the previous value of ak and bk
    previous_value_of_ak = a_k;
    previous_value_of_bk = b_k;
    
    k = 1;
    
    counter_function_usages = 2;
    %use the Golden area method
    while (b_k - a_k) > l
        
        %this if statement insures that every loop the function we be
        %called once
        if previous_value_of_ak ~= a_k
            value_of_function_argument_x1 = f3(x1_k);
        elseif previous_value_of_bk ~= b_k
            value_of_function_argument_x2 = f3(x2_k);
        end
        
        if value_of_function_argument_x1 > value_of_function_argument_x2
            previous_value_of_ak = a_k;
            a_k = x1_k;
            %b_k is the same
            previous_value_of_bk = b_k;
            x1_k = x2_k;
            x2_k = a_k + gamma * (b_k - a_k);
        else
            %a_k is the same
            previous_value_of_ak = a_k;
            previous_value_of_bk = b_k;
            b_k = x2_k;
            x2_k = x1_k;
            x1_k = a_k + (1 - gamma) * (b_k - a_k);
        end
        
        counter_function_usages = counter_function_usages + 1;
        k = k + 1;
        
    end
    function_usages(end + 1) = counter_function_usages;
    counter_l(end + 1) = l;
    l = l + 0.002;
end

plot(counter_l, function_usages, 'o')
