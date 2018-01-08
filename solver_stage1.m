function [l,t,u, steps] = solver_stage1( N )
global components_num;
global int_span;
global u0;
global J;

step0 = int_span/N;

        
u = zeros(components_num, []); u(:,1) = u0;
t = zeros(1,[]); t(1) = 0;
l = zeros(1,[]); l(1) = 0;
f = zeros(1,length(J)+1);
steps = zeros(1,[]);

n = 1;

while t(n) <= int_span
    [phi,psi] = right_hand( u(:,n) );
    [phi, psi, phi_t, psi_t] = arc_length(u, phi, psi);
    
    for j = 1:length(J)
        f(j) = phi(J(j)) - u(J(j))*psi(J(j));
    end
    f(length(J)+1) = phi_t;
    
    if n == 1
        step = step0;
    else
        kappa = ( f - f_prev )/step;
        prod = kappa*kappa';
        step = step0/( 1 + int_span^0.5*prod^0.25 );
    end
    steps(n) = step;
    
    
    u(:,n+1) = chemical_scheme( u(:,n), J, phi  , psi  , step );
    t( n+1 ) = chemical_scheme( t( n ), 1, phi_t, psi_t, step );
    l( n+1 ) = l(n) + step;

    u_half = (u(:,n) + u(:,n+1))/2;

    [phi,psi] = right_hand( u_half );
    [phi, psi, phi_t, psi_t] = arc_length(u, phi, psi);

    u(:,n+1) = chemical_scheme( u(:,n), J, phi  , psi  , step );
    t( n+1 ) = chemical_scheme( t( n ), 1, phi_t, psi_t, step );
    
    f_prev = f;
    
    n = n+1;
    if( n > 1e9 ); break; end
end
end