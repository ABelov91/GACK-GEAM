function R = reactions_input
global C;
global S;
global components_num;

disp('Reactions available in database:');
dim = size(S);
for r = 1:dim(1)
    for j = 1:components_num
        if (S(r,1) == j)
            str0 = strcat( mat2str(r) , ')' );
            str = strcat( str0, char(C(j)) );
        end
    end
    for k = 2:3
        for j = 1:components_num
            if (S(r,k) == j)
                str = strcat( str , '+' );
                str = strcat( str , char(C(j)) );
            end
        end
    end
    if (S(r,7) == 1)
        str = strcat( str , '+M' );
    end

    for j = 1:components_num
        if (S(r,4) == j)
            str = strcat( str , '=' );
            str = strcat( str , char(C(j)) );
        end
    end
    for k = 5:6
        for j = 1:components_num
            if (S(r,k) == j)
                str = strcat( str , '+' );
                str = strcat( str , char(C(j)) );
            end
        end
    end
    if (S(r,7) == 1)
        str = strcat( str , '+M' );
    end
    disp(str)
end

disp('Input necessary reactions');
choice = input('Default: include all reactions. 1 -> yes, 0 -> no: ');
if (choice == 1)
    R = zeros(1,length(S));
    for r = 1:length(S)
        R(r) = r;
    end
end
if (choice == 0)
    Num = input('Input total number of reactions: ');
    R = zeros(1,Num);
    for r = 1:Num
        R(r) = input('Input the number of the required reaction: ');
    end
end
end