function [current_point, value_of_function, number_of_loops] = Steepest_Descent_with_constraints(f, starting_point, gk, epsilon, x_constraints, y_constraints, sk)
    
    syms x y;
    
    %x has values form x_costrains(1) to x_costrains(2)
    %y has values form y_costrains(1) to y_costrains(2)
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    current_point_hyphen = zeros(2, 1);
    f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
    
    %intialize current_point_hyphen
    %calculate current_point_hyphen
    current_point_hyphen = current_point - sk.*f_grad;
        
    %use of the contraints
    %xi = ai if xi <= ai
    if current_point_hyphen(1,1) <= x_constraints(1)
        current_point_hyphen(1,1) = x_constraints(1);
    %xi = bi if xi >= bi
    elseif current_point_hyphen(1,1) >= x_constraints(2)
        current_point_hyphen(1,1) = x_constraints(2);
    end
       
    %xi = ai if xi <= ai
    if current_point_hyphen(2,1) <= y_constraints(1)
        current_point_hyphen(2,1) = y_constraints(1);
    %xi = bi if xi >= bi
    elseif current_point_hyphen(2,1) >= y_constraints(2)
        current_point_hyphen(2,1) = y_constraints(2);
    end
    
    
    f_grad_transposed = (subs(grad_f, [x, y], [current_point_hyphen(1), current_point_hyphen(2)]))';
    
    termination_parameter = abs((sk^2) .* f_grad_transposed * f_grad);
    number_of_loops = 1;
    while termination_parameter > epsilon
        
        %calculate current_point_hyphen
        current_point_hyphen = current_point - sk.*f_grad;
        
        %use of the contraints
        %xi = ai if xi <= ai
        if current_point_hyphen(1,1) <= x_constraints(1)
            current_point_hyphen(1,1) = x_constraints(1);
        %xi = bi if xi >= bi
        elseif current_point_hyphen(1,1) >= x_constraints(2)
            current_point_hyphen(1,1) = x_constraints(2);
        end
        
        %xi = ai if xi <= ai
        if current_point_hyphen(2,1) <= y_constraints(1)
            current_point_hyphen(2,1) = y_constraints(1);
        %xi = bi if xi >= bi
        elseif current_point_hyphen(2,1) >= y_constraints(2)
            current_point_hyphen(2,1) = y_constraints(2);
        end
        
        
        %update parameters
        current_point = round(double(current_point + gk.*(current_point_hyphen - current_point)), 6);
        f_grad = subs(grad_f, [x, y], [current_point(1), current_point(2)]);
        f_grad_transposed = (subs(grad_f, [x, y], [current_point_hyphen(1), current_point_hyphen(2)]))';
        termination_parameter = abs((sk^2) .* f_grad_transposed * f_grad);
        number_of_loops = number_of_loops +1;
    end
    
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
    
end