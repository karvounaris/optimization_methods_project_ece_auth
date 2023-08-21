clear all

syms x
f1 = power(x - 2, 2) + x * log(x + 3);
f2 = power(5, x) + power(2 - cos(x), 2);
f3 = exp(x) * (power(3, x) - 1) + (x - 1) * sin(x);

%not constant
l = 0.005;

%array to store value of ak and bk
array_ak = [];
array_bk = [];
  
%array to store the iterations
array_k = [];
k = 0;

diff_function = diff(f3);

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
    
    array_ak(end + 1) = a_k;
    array_bk(end + 1) = b_k;
        
    k = k + 1;
    array_k(end + 1) = k;

end


plot(array_k, array_ak, 'o')
hold on
plot(array_k, array_bk, 'o')
