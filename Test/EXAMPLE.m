T = 0.172; % temperature is given in the units of eV
int_span = 1e-5; % integration interval
epsilon_user = 1e-3; % required accuracy

[u, epsilon] = GACK_GEAM(T, int_span, epsilon_user);
epsilon % display actual accuracy