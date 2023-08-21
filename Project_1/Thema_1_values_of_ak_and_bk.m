clear all

%not constant
l = 0.015;

%constant
e = 0.001;

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

array_ak(end + 1) = a_k;
array_bk(end + 1) = b_k;
        
k = k + 1;
array_k(end + 1) = k;

%use the Bisector method
while (b_k - a_k) > l
    [x1_k, x2_k] = Bisector_method(a_k, b_k, e);
    
    if f3(x1_k) < f3(x2_k)
        b_k = x2_k;
    else
        a_k = x1_k;
    end
        
    array_ak(end + 1) = a_k;
    array_bk(end + 1) = b_k;
        
    k = k + 1;
    array_k(end + 1) = k;
end
    
    
plot(array_k, array_ak, 'o')
hold on
plot(array_k, array_bk, 'o')


