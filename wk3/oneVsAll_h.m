%% One-vs-All classfier
function Theta = oneVsAll_h(X,y,initial_theta,lambda)
  
  % Input dimension: X(5000,400), y(5000,1), theta(401,1)
  % Output dimension: Theta(10,401)
  [m,n] = size(X);
  Theta = zeros(n,10);
  
  %% Transfer y from vector into matrix using logical array
  labels = (1:10).*ones(m,1);           % labels(5000,10)
  y = (y == labels);                    % y(5000,10)
  
  
  %% Using fmincg to train
  options = optimset('Gradobj','on','MaxIter',400);
 
  for i=1:10
    [Theta(:,i), cost] = fmincg(@(t)(lrCostFunction_h(X,y(:,i),t,lambda)),initial_theta,options);  
  end
  
  Theta = Theta';
  
end
