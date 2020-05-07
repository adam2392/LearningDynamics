function a = arclength_mod(p)
    % takes in geodesic coordinates and returns a matrix of pairwise
    % distances
    
    d = size(p,1); % dimension of coordinates (either 1 or 2)
    n = size(p,2); % number of pairwise points
    a = NaN(n);    % initializing pairwise distance matrix
    
    if d == 1
        for i = 1:n
           for j = 1:n
               a(i,j) = min( abs(p(i) - p(j)) , 2*pi - abs(p(i) - p(j)) );
           end
        end
        
    elseif d == 2
        
    end
return