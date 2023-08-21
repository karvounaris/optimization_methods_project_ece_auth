function [current_point,  value_of_function] = Newton_gk_constant(f, starting_point)
    
    syms x y;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    hessian_f = hessian(f, [x, y]);
    epsilon = 0.01;
    gk = 0.1;
    
    %find gradient and hessian
    f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
    f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    
    %check if the conditions for Newton's method is fulfilled
    if det(f_hessian) > 0 && f_hessian(1,1) > 0
        while norm(f_grad) > epsilon
            %find dk
            dk = -inv(f_hessian) * f_grad;
            
            %update parameters
            current_point = round(double(current_point + gk.*dk), 6);
            f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
            f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)}); 
        end
    end
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
end




