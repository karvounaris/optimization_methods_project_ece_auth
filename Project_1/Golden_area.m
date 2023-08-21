function [x1_k, x2_k] = Golden_area(a_k, b_k)
    
    gamma = 0.618;
    x1_k = a_k + (1 - gamma) * (b_k - a_k);
    x2_k = a_k + gamma * (b_k - a_k);
    
end
