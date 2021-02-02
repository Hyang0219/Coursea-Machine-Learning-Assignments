%% Draw a line when updating centroids
function drawLine_h(x1,x2,varargin)  % take fmt from plot function as input
  
  plot([x1(1) x2(1)],[x1(2) x2(2)],varargin{:});
  
end