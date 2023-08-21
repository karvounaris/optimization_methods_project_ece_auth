function [x1_k, x2_k] = Bisector_method(a_k, b_k, e)
    
    x1_k = (a_k + b_k) / 2 - e;
    x2_k = (a_k + b_k) / 2 + e;
    
end

