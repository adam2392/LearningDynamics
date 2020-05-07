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
    y_init = uniform_dist(d, N, 'line', [0, 2*pi]);
    
  % the 2D case
  case 2
    if d ~= 1
      error('SOD_Examples:OD_init_config:exception', 'For 2D example, d has to be 2!!');
    end 
    y_init = uniform_dist(d, N, 'rectangle', [0, 10]);
    y_init = y_init(:);
  otherwise
end
end
