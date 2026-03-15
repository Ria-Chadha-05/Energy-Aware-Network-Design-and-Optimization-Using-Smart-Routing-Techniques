function plot_routing_path(G,positions,path,title_name)

figure

p = plot(G,'XData',positions(:,1),'YData',positions(:,2), ...
    'EdgeColor',[0.8 0.8 0.8],'NodeColor',[0.9 0.9 0.9]);

hold on

% highlight routing edges
for i = 1:length(path)-1
    highlight(p,path(i),path(i+1),'EdgeColor','r','LineWidth',3)
end

% highlight nodes
highlight(p,path,'NodeColor',[1 0.5 0],'MarkerSize',8)

% source node
highlight(p,path(1),'NodeColor','green','MarkerSize',10)

% destination node
highlight(p,path(end),'NodeColor','red','MarkerSize',10)

title(title_name)

end