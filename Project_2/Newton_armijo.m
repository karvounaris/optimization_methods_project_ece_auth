function [current_point,  value_of_function] = Newton_armijo(f, starting_point)
    
    syms x y;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    hessian_f = hessian(f, [x, y]);
    epsilon = 0.01;
    gk = 1;
    
    %armijo parameters
    a = 10^(-3);    %half of reccommended distance
    b = 3/10;       %half of reccommended distance
    s = 10;
    
    %starting conditions
    mk = 0;
    gk = s * b^mk;
    
    %calculate values of hessian and gradient at starting point
    f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
    f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    
    %check if the conditions for Newton's method is fulfilled
    if det(f_hessian) > 0 && f_hessian(1,1) > 0
        while norm(f_grad) > epsilon
            %find dk
            dk = -inv(f_hessian) * f_grad;
            
            %find gk
            next_point = round(double(current_point + gk.*dk), 6);
            
            %armijo
            while f(current_point(1), current_point(2)) - f(next_point(1), next_point(2)) < -a * b^mk * s * dk' * f_grad           
            mk = mk + 1;
            gk = s * b^mk;
            next_point = round(double(current_point + gk.*dk), 6);
            end
        
            gk = s * b^mk;
            
            %update parameters
            current_point = round(double(current_point + gk.*dk), 6);
            f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
            f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)}); 
        end
    end
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
end

