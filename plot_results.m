function plot_results(Esp, Eea, Eq, Csp, Cea, Cq, PEIsp, PEIea, PEIq)

figure

subplot(1,3,1)

boxplot([Esp Eea Eq])
title('Energy Consumption')
ylabel('Energy')
xticklabels({'Shortest','EnergyAware','Quantum'})


subplot(1,3,2)

boxplot([Csp Cea Cq])
title('Carbon Emissions')
ylabel('CO2')
xticklabels({'Shortest','EnergyAware','Quantum'})


subplot(1,3,3)

boxplot([PEIsp PEIea PEIq])
title('Path Efficiency Indicator')
ylabel('PEI')
xticklabels({'Shortest','EnergyAware','Quantum'})


figure

bar([mean(Esp) mean(Eea) mean(Eq)])
title('Average Energy Consumption')
xticklabels({'Shortest','EnergyAware','Quantum'})
ylabel('Energy')


figure

bar([mean(Csp) mean(Cea) mean(Cq)])
title('Average Carbon Emissions')
xticklabels({'Shortest','EnergyAware','Quantum'})
ylabel('CO2')


figure

bar([mean(PEIsp) mean(PEIea) mean(PEIq)])
title('Average PEI')
xticklabels({'Shortest','EnergyAware','Quantum'})
ylabel('PEI')