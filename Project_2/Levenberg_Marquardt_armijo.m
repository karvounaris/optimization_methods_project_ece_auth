function [current_point, value_of_function] = Levenberg_Marquardt_armijo(f, starting_point)
    syms x y gk;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    hessian_f = hessian(f, [x, y]);
    epsilon = 0.01;
    
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
    
    while norm(f_grad) > epsilon
        
        %update mk and g
        m_k = abs(max(eig(f_hessian)));
        %find the right array for our algorithm, array > 0
        array = f_hessian + m_k * eye(2);
        
        %find the correct mk
        while det(array) <= 0 || array(1,1) <= 0
            m_k = m_k + 0.1;
            array = f_hessian + m_k * eye(2);
        end
    
        dk = - inv(array) * f_grad;
        
        %find gk
        next_point = round(double(current_point + gk.*dk), 6);
          
        %armijo
        while f(current_point(1), current_point(2)) - f(next_point(1), next_point(2)) < -a * b^mk * s * dk' * f_grad           
            mk = mk + 1;
            gk = s * b^mk;
            next_point = round(double(current_point + gk.*dk), 6);
        end
        
        %update parameters
        current_point = round(double(current_point + gk.*dk), 6);
        f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
        f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    end
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
end
