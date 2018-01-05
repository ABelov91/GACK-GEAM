function [phi,psi] = right_hand ( u )
global S;
global components_num;
global J;
global R;
global T;

phi = zeros(1,components_num);
psi = zeros(1,components_num);
  
for m = 1:length(J)
    j = J(m);
    for n = 1:length(R)
        r = R(n);
        if (S(r,7) == 0)
            if (j == S(r,1))
                if (S(r,6) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5))*u(S(r,6));
                end
                if (S(r,6) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5));
                end
                if (S(r,3) ~= 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,2))*u(S(r,3));
                end
                if (S(r,3) == 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,2));
                end
            end
            
            if (j == S(r,2))
                if (S(r,6) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5))*u(S(r,6));
                end
                if (S(r,6) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5));
                end
                if (S(r,3) ~= 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,3));
                end
                if (S(r,3) == 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1));
                end
            end
            
            if (j == S(r,3))
                if (S(r,6) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5))*u(S(r,6));
                end
                if (S(r,6) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5));
                end
                psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2));
            end
            
            if (j == S(r,4))
                if (S(r,3) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2))*u(S(r,3));
                end
                if (S(r,3) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2));
                end
                if (S(r,6) ~= 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,5))*u(S(r,6));
                end
                if (S(r,6) == 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,5));
                end
            end
            
            if (j == S(r,5))
                if (S(r,3) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2))*u(S(r,3));
                end
                if (S(r,3) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2));
                end
                if (S(r,6) ~= 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,6));
                end
                if (S(r,6) == 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4));
                end
            end
            
            if (j == S(r,6))
                if (S(r,3) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2))*u(S(r,3));
                end
                if (S(r,3) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2));
                end
                psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5));
            end
        end
        
        if (S(r,7) == 1)
            M = 0;
            for i = 1:components_num
                M = M + u(i);
            end
            
            if (j == S(r,1))
                if (S(r,5) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5))*M;
                end
                if (S(r,5) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*M;
                end
                psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,2))*M;
            end
            
            if (j == S(r,2))
                if (S(r,5) ~= 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*u(S(r,5))*M;
                end
                if (S(r,5) == 0)
                    phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*M;
                end
                psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*M;
            end
            
            if (j == S(r,4))
                phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2))*M;
                if (S(r,5) ~= 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,5))*M;
                end
                if (S(r,5) == 0)
                    psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*M;
                end
            end
            
            if (j == S(r,5))
                phi(j) = phi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*u(S(r,1))*u(S(r,2))*M;
                psi(j) = psi(j) + 10^(S(r,8))*sqrt( pi*S(r,9)/4 + T )*exp( -S(r,9)/T )*u(S(r,4))*M;
            end
        end
    end
end
end