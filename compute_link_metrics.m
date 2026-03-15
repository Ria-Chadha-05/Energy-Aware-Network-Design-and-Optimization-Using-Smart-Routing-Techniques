function [latency, energy, carbon] = compute_link_metrics(G, positions)

n = numnodes(G);

latency = zeros(n);
energy  = zeros(n);

edges = G.Edges.EndNodes;

for k = 1:size(edges,1)

    i = edges(k,1);
    j = edges(k,2);

    % distance between nodes
    d = norm(positions(i,:) - positions(j,:));

    % latency model
    latency(i,j) = d/2e8;
    latency(j,i) = latency(i,j);

    % energy model
    energy(i,j) = 5 + rand*5;
    energy(j,i) = energy(i,j);

end

% carbon intensity per node
carbon = 200 + rand(n,1)*400;

end