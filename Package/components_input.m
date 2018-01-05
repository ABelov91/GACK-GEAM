function [J,u0] = components_input(R)
global C;
global S;
global components_num;

k = 1;
J0 = zeros(1,components_num);

for r = 1:length(R)    
    for j = 1:6
        temp = S(R(r),j);
        check = 1;
        
        if (temp ~= 0)
            for i = 1:components_num
                if (J0(i) ~= temp)
                    check = check*1;
                else
                    check = check*0;
                end
            end
            if (check == 1)
                J0(k) = temp;
                k = k+1;
            end
        end
    end
end

k = k-1;
J = zeros(1,k);
for j = 1:k
    J(j) = J0(j);
end
J = sort(J);

disp('Input initial concentrations');
choice = input('Default: detonating mixture at normal pressure. 1 -> yes, 0 -> no: ');
u0 = zeros(1,components_num);
if (choice == 1)
    u0(1) = 1.5e-5;
    u0(2) = 3e-5;
    for j = 3:length(J)
        u0(J(j)) = 0;
    end
end
if (choice == 0)
    for j = 1:length(J)
        str1 = 'Input initial concentration for component \';
        str2 = strcat(char( C(J(j)) ),': \');
        u0(J(j)) = input(strcat(str1,str2));
    end
end
end