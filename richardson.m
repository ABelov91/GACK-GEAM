function R0 = richardson( u1, u2 )
dim = size(u1);
R0 = zeros(dim(1),dim(2));
p = 2;

for j = 1:dim(1)
    for n = 1:dim(2)
        R0(j,n) = ( u2( j,2*n-1 ) - u1( j,n ) )/( 2^p-1 );
    end
end
end