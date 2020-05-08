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
%         if nargin == 1
%             
%             for u = 1:pn
%                 for v = u+1:pn
%                     temp1 =  haversine(coordinates(u,1),coordinates(u,2),coordinates(v,1),coordinates(v,2));
%                     a(u,v) = temp1;
%                     a(v,u) = temp1;
%                 end
%             end
%             
%         end
%         if nargin == 2
%             
%             for u = 1:pn
%                 for v = u+1:qn
%                     temp1 =  haversine(coordinates(u,1),coordinates(u,2),coordinates(v,1),coordinates(v,2));
%                     a(u,v) = temp1;
%                     a(v,u) = temp1;
%                 end
%             end
%             
%         end
        if nargin == 1
            lambda_p = p(1,:);  % extracting vector of lambda's
            phi_p = p(2,:);     % extracting vector of phi's
            lambda_q = lambda_p;
            phi_q = phi_p;
        elseif nargin == 2
            lambda_p = p(1,:);  % extracting vector of lambda's
            phi_p = p(2,:);     % extracting vector of phi's
            lambda_q = q(1,:);
            phi_q = q(2,:);
        end
        del_lambda = abs( repmat(lambda_q, pn, 1) - repmat(lambda_p', 1, qn) );  % positive symmetric difference matrix of lambda's
        phi_colmat = repmat(phi_q, pn, 1);
        phi_rowmat = repmat(phi_p', 1, qn);    
        del_phi = abs( phi_colmat - phi_rowmat );  % positive symmetric difference matrix of phi's
        
        %% need to do checks for extraneously phi's and lambdas
        % computing haversine distance
        a = 2*asin( sqrt( sin(del_phi/2).^2 + cos(phi_colmat).*cos(phi_rowmat).*sin(del_lambda/2).^2 ) );

    end
    
return