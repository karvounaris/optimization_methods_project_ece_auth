clear all;

%create function f and plot 
syms x y;
f = @(x,y) (1/3) * (x^2) + 3 * (y^2);
fsurf(f(x,y));
epsilon = 0.01;
gk = 0.2;
x_costrains = [-10 5];
y_costrains = [-8 12];
sk = 0.1;

%create initial points
initial_points = [5 -5; -5 10; 8 -10];

result_points = zeros(2,1);
result_values= 0;
result_number_of_loops = 0;

starting_point = initial_points(3,:)';

%[optimal_point, value] = Steepest_Descent_gk_constant(f, starting_point);    
[optimal_point, value, number_of_loops] = Steepest_Descent_with_constraints(f, starting_point, gk, epsilon, x_costrains, y_costrains, sk);
%[optimal_point, value, number_of_loops] = Steepest_Descent_with_constraints_starting_out_of_the_area(f, starting_point, gk, epsilon, x_costrains, y_costrains, sk);    

result_number_of_loops = number_of_loops;
result_values = value;
result_points = optimal_point;
