function call_database
global components_num;
global C;
C = cellstr( char('O2','H2','O','H','OH','HO2','H2O2','H2O','O3') );
components_num = length(C);

global S;
fid = fopen('Reactions.txt','r');
S0 = fscanf(fid,'%g');
max_R = length(S0)/9;
S = zeros(max_R,9);
for r = 1:max_R
    for j = 1:9
        S(r,j) = S0(j + 9*(r-1));
    end
end
end