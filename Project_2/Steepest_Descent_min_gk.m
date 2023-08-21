function [current_point, value_of_function] = Steepest_Descent_min_gk(f, starting_point)
    syms x y gk;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
    epsilon = 0.01;
    
    
    while norm(f_grad) > epsilon
        dk = -f_grad;
        
        %optimize gk
        g = @(gk) f(current_point(1) + gk.*dk(1),(current_point(2) + gk.*dk(2)));
        gk = Golden_Search(g, current_point);
        
        %update parameters
        current_point = round(double(current_point + gk.*dk), 6);
        f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
    end
    
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
    
end
