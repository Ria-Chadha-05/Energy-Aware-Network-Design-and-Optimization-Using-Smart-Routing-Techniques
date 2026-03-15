function plot_network_topology(G,positions)

figure

plot(G,'XData',positions(:,1),'YData',positions(:,2), ...
    'NodeColor','k','MarkerSize',6,'EdgeColor',[0.7 0.7 0.7])

title('Network Topology (Waxman Model)')
xlabel('X Position')
ylabel('Y Position')

grid on

end