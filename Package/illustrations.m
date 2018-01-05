function illustrations( t, u, first_stage_grids, step_nums, precision_output, D_output )

global C;
global J;

figure; xlabel('Time, s'); ylabel('Concentrations, mole/cm3')
title('SOLUTION COMPONENTS');
hold on
temp = zeros(1,length(t));
C1 = cell(length(J),1);
for j = 1:length(J)
    for n = 1:length(t)
        temp(n) = u(J(j),n);
    end
    C1(j) = C( J(j) );
    plot(t,temp,'LineWidth',2);
end
legend(char(C1))

figure; xlabel('lg N'); ylabel('lg epsilon')
title('CONVERGENCE: RELATIVE ACCURACY');
hold on
N = zeros(1,length(precision_output));
for m = 1:length(precision_output)
    N(m) = step_nums(m + first_stage_grids);
end
plot(log10(N),log10(precision_output),'-ok','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',11)

figure; xlabel('lg N'); ylabel('lg D')
title('CONVERGENCE: RELATIVE DISBALANCE')
hold on
N = zeros(1,length(D_output));
for m = 1:length(D_output)
    N(m) = step_nums(m);
end
plot(log10(N),log10(D_output),'-ok','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',11)
end