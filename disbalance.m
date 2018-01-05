function D = disbalance(N, u)
global components_num;
global J;

D_h = zeros(1,N);
D_o = zeros(1,N);
D_total = zeros(1,N);
temp  = zeros(components_num,1);
temp0 = zeros(components_num,1);
for j = 1:components_num
    temp0(j) = u(j,1);
end
for n = 1:N+1
    for j = 1:components_num
        temp(j) = u(j,n);
    end
    [Balance_h , Balance_o ] = element_balance( temp , J );
    [Balance_h0, Balance_o0] = element_balance( temp0, J );
    D_h(n) = Balance_h/Balance_h0 - 1;
    D_o(n) = Balance_o/Balance_o0 - 1;
end
for n = 1:N+1
    D_total(n) = sqrt( D_o(n)^2 + D_h(n)^2 );
end
D = max(D_total);
end