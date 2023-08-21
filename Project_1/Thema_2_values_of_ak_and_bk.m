clear all

%initialazation, not constant
l = 0.015;

%constant
gamma = 0.618;

%a_k start
a_k = -1;
%b_k start
b_k = 3;

%array to store value of ak and bk
array_ak = [];
array_bk = [];
  
%array to store the iterations
array_k = [];
k = 0;
    
%first calculation of the limits
[x1_k, x2_k] = Golden_area(a_k, b_k);

%store the value of the function
value_of_function_argument_x1 = f3(x1_k);
value_of_function_argument_x2 = f3(x2_k);
 
array_ak(end + 1) = a_k;
array_bk(end + 1) = b_k;

k = k + 1;
array_k(end + 1) = k;

%store the previous value of ak and bk
previous_value_of_ak = a_k;
previous_value_of_bk = b_k;

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
    
    array_ak(end + 1) = a_k;
    array_bk(end + 1) = b_k;
        
    k = k + 1;
    array_k(end + 1) = k;
    
end
    
plot(array_k, array_ak, 'o')
hold on
plot(array_k, array_bk, 'o')

