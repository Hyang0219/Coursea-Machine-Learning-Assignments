%% Compute cost function and gradient
function [J,grad] = lrCostFunction_h(X,y,theta,lambda)
  
  [m,n] = size(X);          % X(5000,401), theta(401,1)
  theta_r = theta(2:end);   % theta_r(400,1)
  J = 1/m*sum(-y.*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta)))+lambda/2/m*theta_r'*theta_r;
  grad = zeros(n,1);
  grad(1) = 1/m*X(:,1)'*(sigmoid(X*theta)-y);
  grad(2:end) = 1/m*X(:,2:end)'*(sigmoid(X*theta)-y)+lambda/m*theta_r;
  
end
