function steps_new = thicken(steps)
N = length(steps);
steps_new = zeros(1,2*N);
for n = 2:N-1
    steps_new( 2*n ) = steps(n)*steps(n+1)^0.25/( steps(n+1)^0.25 + steps(n-1)^0.25 );
    steps_new(2*n-1) = steps(n)*steps(n-1)^0.25/( steps(n+1)^0.25 + steps(n-1)^0.25 );
end
steps_new(1) = steps(1)*steps(1)^0.5/( steps(1)^0.5 + steps(2)^0.5 );
steps_new(2) = steps(1)*steps(2)^0.5/( steps(1)^0.5 + steps(2)^0.5 );
steps_new(2*N-1) = steps(N)*steps(N-1)^0.5/( steps(N-1)^0.5 + steps(N)^0.5 );
steps_new( 2*N ) = steps(N)*steps( N )^0.5/( steps(N-1)^0.5 + steps(N)^0.5 );
end