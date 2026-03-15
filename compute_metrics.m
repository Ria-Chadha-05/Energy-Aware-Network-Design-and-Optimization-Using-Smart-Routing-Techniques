function [L,E,C,PEI] = compute_metrics(path, latency, energy, carbon)

L = 0;
E = 0;
C = 0;

for i = 1:length(path)-1
    
    n1 = path(i);
    n2 = path(i+1);
    
    L = L + latency(n1,n2);
    E = E + energy(n1,n2);
    C = C + carbon(n1);
    
end

% --- Path Efficiency Indicator (PEI) ---

LEI = 1 / (1 + L);     % Link efficiency
HEI = 1 / (1 + E);     % Hardware efficiency

PEI = LEI + HEI;