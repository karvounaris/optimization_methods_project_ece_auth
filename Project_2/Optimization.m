clear all;

%create function f and plot 
syms x y;
f = @(x,y) x^5 * exp(-x^2 -y^2);
%fsurf(f(x,y));

%create initial points
initial_points = [0 0; -1 1; 1 -1];

matrix_points = zeros(2,3);
matrix_values = zeros(1,3);

for i = 1:1:3
    starting_point = initial_points(i,:)';
    
    [optimal_point, value] = Steepest_Descent_gk_constant(f, starting_point);
    [optimal_point, value] = Steepest_Descent_min_gk(f, starting_point);
    [optimal_point, value] = Steepest_Descent_armijo(f, starting_point);
    
    [optimal_point, value] = Newton_gk_constant(f, starting_point);
    [optimal_point, value] = Newton_min_gk(f, starting_point);
    [optimal_point, value] = Newton_armijo(f, starting_point);
    
    [optimal_point, value] = Levenberg_Marquardt_gk_constant(f, starting_point);
    [optimal_point, value] = Levenberg_Marquardt_min_gk(f, starting_point);
    [optimal_point, value] = Levenberg_Marquardt_armijo(f, starting_point);
    
    matrix_values(i) = value;
    matrix_points(:, i) = optimal_point;
end