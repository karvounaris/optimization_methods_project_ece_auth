function [result] = Golden_Search(g,xk)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
lower_val = 0; %gk > 0
upper_val = 10;
l = 0.01;
gr = 0.618; 
%Initialization of x1_k,x2_k by using the Golden Section
%function.
xk(1) = lower_val + (1 - gr) * (upper_val - lower_val);
xk(2) = lower_val + gr * (upper_val - lower_val);
while upper_val-lower_val>l
    if g(xk(1)) > g(xk(2))
        lower_val = xk(1);
        xk(1) = xk(2);
        xk(2) = lower_val + gr * (upper_val -lower_val);
    else
        upper_val = xk(2);
        xk(2) = xk(1);
        xk(1) = lower_val + (1 - gr) * (upper_val - lower_val);
    end
   
end
result = (lower_val+upper_val)/2;
end

