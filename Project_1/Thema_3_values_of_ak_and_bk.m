clear all

%initialazation, not constant
l = 0.015;

%constant
e = 0.001;

%array to store the iterations
array_k = [];

%array to store value of ak and bk
array_ak = [];
array_bk = [];

n = 20;

%a_k start
a_k = -1;
%b_k start
b_k = 3;

%use Fibonacci method
x1_k = a_k + (Fibonacci_method(n - 2) / Fibonacci_method(n)) * (b_k - a_k);
x2_k = a_k + (Fibonacci_method(n - 1) / Fibonacci_method(n)) * (b_k - a_k);
    
%store the value of the function
value_of_function_argument_x1 = f3(x1_k);
value_of_function_argument_x2 = f3(x2_k);
    
%store the previous value of the function for the step 5 of the
%algorithm
previous_value_of_function_argument_x1 = 0;
previous_value_of_function_argument_x2 = 0;
 
%store the previous value of x_k for the step 5 of the
%algorithm
previous_value_of_x1_k = 0;
previous_value_of_x2_k = 0;
   
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
        previous_value_of_function_argument_x1 = value_of_function_argument_x1;
        value_of_function_argument_x1 = f3(x1_k);
    elseif previous_value_of_bk ~= b_k
        previous_value_of_function_argument_x2 = value_of_function_argument_x2;
        value_of_function_argument_x2 = f3(x2_k);
    end
       
    if value_of_function_argument_x1 > value_of_function_argument_x2
        previous_value_of_ak = a_k;
        a_k = x1_k;
        %b_k is the same
        previous_value_of_bk = b_k;
        previous_value_of_function_argument_x1 = x1_k;
        previous_value_of_function_argument_x2 = x2_k;
        x1_k = x2_k;
        x2_k = a_k + (Fibonacci_method(n - k - 1) / Fibonacci_method(n - k)) * (b_k - a_k);
           
        if k == n - 2
            x_1n = previous_value_of_x1_k;
            x_2n = previous_value_of_x1_k + e;
            if previous_value_of_function_argument_x1 > f3(x_2n)
                a_k = x_n1;
                b_k = previous_value_of_bk;
                counter_function_usages = counter_function_usages + 1;
                break;
            else
                a_k = previous_value_of_ak;
                b_k  = x_2n;
                counter_function_usages = counter_function_usages + 1;
                break
            end  
        end
            
    else
        %a_k is the same
        previous_value_of_ak = a_k;
        previous_value_of_bk = b_k;
        previous_value_of_function_argument_x1 = x1_k;
        previous_value_of_function_argument_x2 = x2_k;
        b_k = x2_k;
        x2_k = x1_k;
        x1_k = a_k + (Fibonacci_method(n - k - 2) / Fibonacci_method(n - k)) * (b_k - a_k);
           
        if k == n - 2
            x_1n = previous_value_of_x1_k;
            x_2n = previous_value_of_x1_k + e;
            if previous_value_of_function_argument_x1 > f3(x_2n)
                a_k = x_n1;
                b_k = previous_value_of_bk;
                counter_function_usages = counter_function_usages + 1;
                break
            else
                a_k = previous_value_of_ak;
                b_k  = x_2n;
                counter_function_usages = counter_function_usages + 1;
                break
            end  
        end
    end
    
    array_ak(end + 1) = a_k;
    array_bk(end + 1) = b_k;
    
    array_k(end + 1) = k;
    k = k + 1;
        
end

plot(array_k, array_ak, 'o')
hold on
plot(array_k, array_bk, 'o')