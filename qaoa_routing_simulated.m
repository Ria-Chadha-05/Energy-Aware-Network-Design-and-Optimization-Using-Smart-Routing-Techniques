function best_path = qaoa_routing_simulated(paths, latency, energy, carbon)

alpha = 0.3;
beta = 0.3;
gamma = 0.4;

best_cost = inf;

for i = 1:length(paths)
    
    p = paths{i};
    
    L = 0;
    E = 0;
    C = 0;
    
    for k = 1:length(p)-1
        
        i1 = p(k);
        i2 = p(k+1);
        
        L = L + latency(i1,i2);
        E = E + energy(i1,i2);
        C = C + carbon(i1);
        
    end
    
    cost = alpha*L + beta*E + gamma*C;
    
    if cost < best_cost
        
        best_cost = cost;
        best_path = p;
        
    end
    
end

end