function [current_point,  value_of_function] = Newton_min_gk(f, starting_point)
    
    syms x y gk;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    hessian_f = hessian(f, [x, y]);
    epsilon = 0.01;
    
    %find gradient and hessian
    f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
    f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    
    %check if the conditions for Newton's method is fulfilled
    if det(f_hessian) > 0 && f_hessian(1,1) > 0
        while norm(f_grad) > epsilon
            %find dk
            dk = -inv(f_hessian) * f_grad;
            
            %optimize gk
            g = @(gk) f(current_point(1) + gk.*dk(1),(current_point(2) + gk.*dk(2)));
            gk = Golden_Search(g, current_point);
            
            %update parameters
            current_point = round(double(current_point + gk.*dk), 6);
            f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
            f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)}); 
        end
    end
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
end
