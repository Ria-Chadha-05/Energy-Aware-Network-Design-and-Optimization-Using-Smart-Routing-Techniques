function paths = yen_k_shortest_paths(G, s, d, K)

paths = {};
costs = [];

% First shortest path
[p, cost] = shortestpath(G, s, d);
paths{1} = p;
costs(1) = cost;

B = {};

for k = 2:K
    
    for i = 1:length(paths{k-1})-1
        
        spurNode = paths{k-1}(i);
        rootPath = paths{k-1}(1:i);
        
        Gtemp = G;
        
        % Remove edges that share same root
        for pIndex = 1:length(paths)
            
            if length(paths{pIndex}) >= i && ...
               isequal(rootPath, paths{pIndex}(1:i))
               
               edge = [paths{pIndex}(i) paths{pIndex}(i+1)];
               Gtemp = rmedge(Gtemp, edge(1), edge(2));
               
            end
        end
        
        try
            spurPath = shortestpath(Gtemp, spurNode, d);
            
            totalPath = [rootPath spurPath(2:end)];
            B{end+1} = totalPath;
            
        catch
        end
        
    end
    
    if isempty(B)
        break
    end
    
    % choose lowest cost path
    bestCost = inf;
    bestPath = [];
    
    for i = 1:length(B)
        
        p = B{i};
        c = length(p);
        
        if c < bestCost
            bestCost = c;
            bestPath = p;
        end
        
    end
    
    paths{k} = bestPath;
    
end