function [current_point, value_of_function] = Levenberg_Marquardt_min_gk(f, starting_point)
    syms x y gk;
    
    %initialize conditions
    current_point = starting_point;
    %function's gradient
    grad_f = gradient(f, [x, y]);
    hessian_f = hessian(f, [x, y]);
    f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
    f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    epsilon = 0.01;
    
    
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
        
        %optimize gk
        g = @(gk) f(current_point(1) + gk.*dk(1),(current_point(2) + gk.*dk(2)));
        gk = Golden_Search(g, current_point);
        
        %update parameters
        current_point = round(double(current_point + gk.*dk), 6);
        f_grad = subs(grad_f, {x, y}, {current_point(1), current_point(2)});
        f_hessian = subs(hessian_f, {x, y}, {current_point(1), current_point(2)});
    end
    value_of_function = subs(f, {x, y}, {current_point(1), current_point(2)});
end
