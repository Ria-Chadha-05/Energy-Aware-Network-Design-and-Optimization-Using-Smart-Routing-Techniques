function [G, positions] = generate_waxman_topology(n, alpha, beta)

% n = 15
% alpha = 0.5
% beta = 0.5

% Random node positions
positions = rand(n,2)*1000;

% Maximum distance
L = max(pdist(positions));

adj = zeros(n);

for i = 1:n
    for j = i+1:n
        
        d = norm(positions(i,:) - positions(j,:));
        
        p = alpha * exp(-d/(beta*L));
        
        if rand < p
            adj(i,j) = d;
            adj(j,i) = d;
        end
        
    end
end

G = graph(adj);