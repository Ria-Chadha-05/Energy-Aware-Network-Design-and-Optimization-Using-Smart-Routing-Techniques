clear
clc

%% PARAMETERS
nodes = 15;
flows = 200;

%% GENERATE NETWORK
[G, positions] = generate_waxman_topology(nodes,0.7,0.7);

%% COMPUTE LINK METRICS
[latency, energy, carbon] = compute_link_metrics(G,positions);

%% RESULT STORAGE

energy_sp = zeros(flows,1);
energy_ea = zeros(flows,1);
energy_q  = zeros(flows,1);

carbon_sp = zeros(flows,1);
carbon_ea = zeros(flows,1);
carbon_q  = zeros(flows,1);

pei_sp = zeros(flows,1);
pei_ea = zeros(flows,1);
pei_q  = zeros(flows,1);

%% SIMULATION LOOP

for f = 1:flows
    
    % Random source and destination
    s = randi(nodes);
    d = randi(nodes);
    
    while d == s
        d = randi(nodes);
    end
    
    % Generate candidate paths
    paths = yen_k_shortest_paths(G,s,d,30);
    
    % ROUTING METHODS
    
    % Shortest Path
    p1 = shortest_path_routing(G,s,d);
    
    % Energy Aware Routing
    p2 = energy_aware_routing(paths,latency,energy);
    
    % Quantum Routing (simulated QAOA)
    p3 = qaoa_routing_simulated(paths,latency,energy,carbon);
    
    
    %% COMPUTE METRICS
    
    [~, Esp, Csp, PEIsp] = compute_metrics(p1,latency,energy,carbon);
    [~, Eea, Cea, PEIea] = compute_metrics(p2,latency,energy,carbon);
    [~, Eq,  Cq,  PEIq ] = compute_metrics(p3,latency,energy,carbon);
    
    
    %% STORE RESULTS
    
    energy_sp(f) = Esp;
    energy_ea(f) = Eea;
    energy_q(f)  = Eq;
    
    carbon_sp(f) = Csp;
    carbon_ea(f) = Cea;
    carbon_q(f)  = Cq;
    
    pei_sp(f) = PEIsp;
    pei_ea(f) = PEIea;
    pei_q(f)  = PEIq;

end


%% PLOT RESULTS

plot_results(energy_sp,energy_ea,energy_q,...
             carbon_sp,carbon_ea,carbon_q,...
             pei_sp,pei_ea,pei_q);


%% VISUALIZE ROUTING DIFFERENCES

found = false;

while ~found

    s = randi(nodes);
    d = randi(nodes);

    while d == s
        d = randi(nodes);
    end

    paths = yen_k_shortest_paths(G,s,d,30);

    p1 = shortest_path_routing(G,s,d);
    p2 = energy_aware_routing(paths,latency,energy);
    p3 = qaoa_routing_simulated(paths,latency,energy,carbon);

    if ~isequal(p1,p2) && ~isequal(p2,p3) 
        found = true;
    end

end

plot_network_topology(G,positions)

% plot_routing_path(G,positions,p1,'Fig 6: Shortest Path Routing')
% plot_routing_path(G,positions,p2,'Fig 7: Energy-Aware Routing')
% plot_routing_path(G,positions,p3,'Fig 8: Quantum Routing')

animate_packet_flow(G,positions,p1,'Packet Flow - Shortest Path')
animate_packet_flow(G,positions,p2,'Packet Flow - Energy-Aware')
animate_packet_flow(G,positions,p3,'Packet Flow - Quantum Routing')