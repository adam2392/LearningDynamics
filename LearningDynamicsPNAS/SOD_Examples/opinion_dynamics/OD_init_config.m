function y_init = OD_init_config(d, N, kind)

%

% (c) M. Zhong, JHU

switch kind
  % the 1D case   
  case 1
    if d ~= 1
      error('SOD_Examples:OD_init_config:exception', 'For 1D example, d has to be 1!!');
    end
    % generate IC on uniform euclidean line
    % y_init = uniform_dist(d, N, 'line', [0, 10]);
    
    % generate IC on circle between  0 and 360 degreees
    y_init = uniform_dist(d, N, 'line', [0, pi/2]);
    
  % the 2D case
  case 2
    if d ~= 2
      error('SOD_Examples:OD_init_config:exception', 'For 2D example, d has to be 2!!');
    end
    % generate on IC on a square
%     y_init = uniform_dist(d,s N, 'rectangle', [0, 10]);
    
    % geenerate IC in a 3D sphere
    y_init = uniform_dist(d, N, 'rectangle', [0, 2*pi, 0, pi]);
    
    y_init = y_init(:);
  otherwise
end
end
