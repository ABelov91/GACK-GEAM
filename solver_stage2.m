function [l,t,u] = solver_stage2( steps, N )
global components_num;
global u0;
global J;
        
u = zeros(components_num, N+1); u(:,1) = u0;
t = zeros(1,N+1); t(1) = 0;
l = zeros(1,N+1); l(1) = 0;

for n = 1:N
    [phi,psi] = right_hand( u(:,n) );
    [phi, psi, phi_t, psi_t] = arc_length(u, phi, psi);
    
    u(:,n+1) = chemical_scheme( u(:,n), J, phi  , psi  , steps(n) );
    t( n+1 ) = chemical_scheme( t( n ), 1, phi_t, psi_t, steps(n) );
    l( n+1 ) = l(n) + steps(n);

    u_half = (u(:,n) + u(:,n+1))/2;

    [phi,psi] = right_hand( u_half);
    [phi, psi, phi_t, psi_t] = arc_length(u, phi, psi);
    
    u(:,n+1) = chemical_scheme( u(:,n), J, phi  , psi  , steps(n) );
    t( n+1 ) = chemical_scheme( t( n ), 1, phi_t, psi_t, steps(n) );
    
end
end