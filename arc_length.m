function [phi, psi, phi_t, psi_t] = arc_length(u, phi, psi)
global J;

sum = 0;
for j = 1:length(J)
    rh = phi(J(j)) - u(J(j))*psi(J(j));
    sum = sum + rh^2;
end
den = sqrt(1 + sum);
phi = phi/den; phi_t = 1/den;
psi = psi/den; psi_t = 0;
end