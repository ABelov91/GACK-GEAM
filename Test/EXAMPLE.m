T = 1.5^(0)*0.172; % 0 -> 2000 K, 1 -> 3000 K, 2 -> 4500 K, 3 -> 6750 K
int_span = 1e-5; % integration interval
epsilon_user = 1e-3; % required accuracy

[u, epsilon] = GACK_GEAM(T, int_span, epsilon_user);
epsilon % display actual accuracy