function [current_point, value_of_function, number_of_loops] = Steepest_Descent_gk_constant(f, starting_point, gk, epsilon)
    
    syms x y;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
    
    number_of_loops = 0;
    while norm(f_grad) > epsilon
        dk = -f_grad;
        
        %update parameters
        current_point = round(double(current_point + gk.*dk), 6);
        f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
        number_of_loops = number_of_loops +1;
    end
    
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
    
end

