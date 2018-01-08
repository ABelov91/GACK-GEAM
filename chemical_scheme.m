function u_hat = chemical_scheme( u, J, phi, psi, step )
u_hat = zeros(1,length(u));
for j = 1:length(J)
    u_hat(J(j)) = ( u(J(j)) + step*phi(J(j))*(1 + step*psi(J(j))/2) )/(1 + step*psi(J(j)) + step^2*psi(J(j))^2/2 );
end
end