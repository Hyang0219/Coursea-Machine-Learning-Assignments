%% Plot decision boundary
function plotDecisionBoundary_h(X,y,theta)
  
  plotData(X(:,2:3), y);
  hold on;
  
  [m,n] = size(X);
  
  if n <= 3
    % n = 3, then decision boundary determined by a line
    % To draw line, define the two points
    x1 = [min(X(:,2))-2,max(X(:,2))+2];
    x2 = (-theta(1)-x1.*theta(2))./theta(3);
    
    % plot decision boundary
    plot(x1,x2);
    legend('Admitted', 'Not admitted', 'Decision Boundary');
    axis([30, 100, 30, 100]);
    
  else    
    % if n > 3, use contour to draw the decision boundary
    v = linspace(-1,1.5,50);
    u = linspace(-0.8,1.2,50);
    
    vals = zeros(length(v),length(u));
    
    for i = 1:length(v)
      for j = 1:length(u)
        vals(i,j) = (mapFeature_h(v(i),u(j),6)*theta;
      end
    end
    
    vals = vals';
    contour(v,u,vals,[0,0],'LineWidth',2)
  end
  
  hold off;
end
