function best_path = energy_aware_routing(paths, latency, energy)

w1 = 0.5;
w2 = 0.5;

best_cost = inf;

for i = 1:length(paths)
    
    p = paths{i};
    
    L = 0;
    E = 0;
    
    for k = 1:length(p)-1
        
        L = L + latency(p(k),p(k+1));
        E = E + energy(p(k),p(k+1));
        
    end
    
    cost = w1*L + w2*E;
    
    if cost < best_cost
        
        best_cost = cost;
        best_path = p;
        
    end
    
end

end