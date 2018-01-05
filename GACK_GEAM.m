function [u, epsilon] = GACK_GEAM( Temperature, time, epsilon_user )
% Solves chemical kinetics problem with guaranteed accuracy. The user sets
% temperature (in eV), integration interval and required relative accuracy
% The program displays the list of the reactions available in the database
% and proposes to input the numbers of required reactions. Then it
% determines the components involved into the reactions and proposes to
% input initial conditions for them (default: detonating mixture at normal 
% conditions). After that, the calculation on a sequence of nested meshes
% is carried out until relative accuracy determined by Richardson method is
% less than the user-defined accuracy.

global int_span;
global u0;
global J;
global R;
global T;


call_database;
R = reactions_input;
[J,u0] = components_input(R);

int_span = time;
T = Temperature;

N0 = 10;
Delta = 1e-4;
max_grid_num = 20;
precision = zeros(1,max_grid_num);
D = zeros(1,max_grid_num+1);
step_nums = zeros(1,max_grid_num+1);

precision_temp = 1;
diff = 1;
m = 1;
N = N0;
while ( diff > Delta )
    if( m == 1 )
        [l,t,u, steps1] = solver_stage1( N );
        step_nums(m) = length(steps1);
        D(m) = disbalance(step_nums(m), u);
        l1 = l;
    else
        [l,t,u, steps1] = solver_stage1( N );
        step_nums(m) = length(steps1);
        D(m) = disbalance(step_nums(m), u);
        l2 = l;
        L = max(l);
        
        diff = 0;
        for n = 1:step_nums(m-1)
            diff = diff + (l2(2*n-1) - l1(n))^2;
        end
        diff = sqrt( diff/step_nums(m-1) )/L;
        
        l1 = l2;
    end
    N = 2*N;
       
    m = m+1;
    if (m > max_grid_num)
        break;
    end
    first_stage_grids = m-1;
end
u1 = u;
t1 = t;

while ( precision_temp > epsilon_user )

    steps2 = thicken(steps1);
    N = length(steps2);
    step_nums(m) = N;
    
    [~,t,u] = solver_stage2( steps2, N );
    D(m) = disbalance(N, u);
    u2 = u;
    t2 = t;
    
    init_conc = 0;
    for j = 1:length(J)
        init_conc = init_conc + u0(J(j));
    end

    precision_u = richardson( u1, u2 );
    precision_t = richardson( t1, t2 );
    for j = 1:length(J)
        for n = 1:N/2+1
            [phi,psi] = right_hand( u(:,2*n-1) );
            rh = phi(J(j)) - u(J(j),2*n-1)*psi(J(j));
            precision_u(J(j),n) = precision_u(J(j),n) - precision_t(n)*rh;
        end
    end
    precision_temp = max( max( abs(precision_u) ) )/init_conc;
    precision(m) = precision_temp;
       
    m = m+1;
    if (m > max_grid_num)
        break;
    end
    u1 = u2;
    t1 = t2;
    steps1 = steps2;
end


second_stage_grids = m - 1 - first_stage_grids;

precision_output = zeros(1,second_stage_grids);
D_output = zeros(1,second_stage_grids + first_stage_grids);
for m = 1:second_stage_grids
    precision_output(m) = precision(m + first_stage_grids);
end
for m = 1:second_stage_grids + first_stage_grids
    D_output(m) = D(m);
end

epsilon = precision_output(second_stage_grids);

illustrations( t, u, first_stage_grids, step_nums, precision_output, D_output )
end