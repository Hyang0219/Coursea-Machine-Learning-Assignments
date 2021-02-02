%% Compute cost function
function [J, grad] = linearRegCostFunction_h(X,y,theta,lambda)
  
  [m,n] = size(X);
  J = 1/2/m*sum((X*theta-y).^2)+lambda/2/m*sum(theta(2:end).^2);
  
  grad = zeros(n,1);
  grad(1) = 1/m*X(:,1)'*(X*theta-y);
  grad(2:end) = 1/m*X(:,2:end)'*(X*theta-y) + lambda/m*theta(2:end);
  
end
