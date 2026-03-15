function animate_packet_flow(G,positions,path,title_name)

figure('Name',title_name)

% draw network
p = plot(G,'XData',positions(:,1),'YData',positions(:,2), ...
    'EdgeColor',[0.8 0.8 0.8],'NodeColor',[0.9 0.9 0.9]);

hold on

% highlight routing path edges
for i = 1:length(path)-1
    highlight(p,path(i),path(i+1),'EdgeColor',[1 0.4 0],'LineWidth',3)
end

% highlight nodes in path
highlight(p,path,'NodeColor',[1 0.5 0],'MarkerSize',8)

% source node
highlight(p,path(1),'NodeColor','green','MarkerSize',10)

% destination node
highlight(p,path(end),'NodeColor','red','MarkerSize',10)

title(title_name)

% create packet marker
packet = plot(positions(path(1),1),positions(path(1),2), ...
    'bo','MarkerSize',10,'MarkerFaceColor','blue');

% animate movement along edges
for i = 1:length(path)-1

    x1 = positions(path(i),1);
    y1 = positions(path(i),2);

    x2 = positions(path(i+1),1);
    y2 = positions(path(i+1),2);

    for t = linspace(0,1,25)

        x = x1 + t*(x2-x1);
        y = y1 + t*(y2-y1);

        set(packet,'XData',x,'YData',y)

        pause(0.03)

    end

end

end