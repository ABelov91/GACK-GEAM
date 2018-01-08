function [Balance_h, Balance_o] = element_balance( v, J )
Balance_h = 0;
Balance_o = 0;
for j = 1:length(J)
    if (J(j) == 2)
        Balance_h = Balance_h + 2*v(2);
    end
    if (J(j) == 4)
        Balance_h = Balance_h + v(4);
    end
    if (J(j) == 5)
        Balance_h = Balance_h + v(5);
    end
    if (J(j) == 6)
        Balance_h = Balance_h + v(6);
    end
    if (J(j) == 7)
        Balance_h = Balance_h + 2*v(7);
    end
    if (J(j) == 8)
        Balance_h = Balance_h + 2*v(8);
    end 

    if (J(j) == 1)
        Balance_o = Balance_o + 2*v(1);
    end
    if (J(j) == 3)
        Balance_o = Balance_o + v(3);
    end
    if (J(j) == 5)
        Balance_o = Balance_o + v(5);
    end
    if (J(j) == 6)
        Balance_o = Balance_o + 2*v(6);
    end
    if (J(j) == 7)
        Balance_o = Balance_o + 2*v(7);
    end
    if (J(j) == 8)
        Balance_o = Balance_o + v(8);
    end
    if (J(j) == 9)
        Balance_o = Balance_o + 3*v(9);
    end
end
end