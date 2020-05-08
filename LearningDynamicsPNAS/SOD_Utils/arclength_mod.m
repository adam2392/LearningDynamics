function a = arclength_mod(p, q)
    % takes in geodesic coordinates and returns a matrix of pairwise
    % distances
    
    [d, pn] = size(p); % d = dimension of coordinates (either 1 or 2); pn is the number of pairwise points
    
    % determining whether only one argument is passed in or not
    if nargin==1
        qn = pn;
    else
        [d, qn] = size(q);
    end
    % if there is nothing (pn = qn = 0), then we return an empty matrix
    if pn == 0 || qn == 0
        a = zeros(pn,qn); % an empty matrix
        return
    end
    
    a = NaN(pn, qn);    % initializing pairwise distance matrix
    
    if d == 1 % 1D case (circle) in R2
        if nargin == 1
            for i = 1:pn
               for j = 1:pn
                   a(i,j) = min( abs(p(i) - p(j)) , 2*pi - abs(p(i) - p(j)) );
               end
            end
        end
        if nargin == 2
            for i = 1:pn
               for j = 1:qn
                   a(i,j) = min( abs(p(i) - q(j)) , 2*pi - abs(p(i) - q(j)) );
               end
            end
        end
        
    elseif d == 2 % 2D case in R3
        if nargin == 1
            for i = 1:pn
               for j = 1:pn
%                    dist = acos(sin(p/
                   a(i,j) = min( acos( cos(p(i,1) - p(j,1))*cos(p(i,2))*cos(p(j,2)) + sin(p(i,2))*sin(p(j,2)) ), 2*pi - acos( cos(p(i,1) - p(j,1))*cos(p(i,2))*cos(p(j,2)) + sin(p(i,2))*sin(p(j,2)) ) );
               end
            end
        end
        if nargin == 2
            for i = 1:pn
               for j = 1:qn
                   a(i,j) = min( acos( cos(p(i,1) - q(j,1))*cos(p(i,2))*cos(q(j,2)) + sin(p(i,2))*sin(q(j,2)) ), 2*pi - acos( cos(p(i,1) - q(j,1))*cos(p(i,2))*cos(q(j,2)) + sin(p(i,2))*sin(q(j,2)) ) );
               end
            end
        end
    end

return