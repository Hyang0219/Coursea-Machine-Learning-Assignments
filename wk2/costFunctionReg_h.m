%% Compute cost function and gradient descent of logistic regression
function [J,grad] = costFunctionReg_h(X,y,theta,lambda)
  
  % number of training examples and number of features
  [m,n] = size(X);
  
  % Define regularised parameters
  theta_r = theta(2:end);
  
  % Initilise grad
  grad = zeros(1,n);
  
  % Compute cost function
  J = 1/m*sum(-y.*log(sigmoid_h(X*theta))-(1-y).*log(1-sigmoid_h(X*theta)))+lambda/2/m*theta_r'*theta_r;
    
  % Compute gradient descent
  grad(1) = 1/m*X(:,1)'*(sigmoid_h(X*theta)-y);
  grad(2:end) = 1/m*X(:,2:end)'*(sigmoid_h(X*theta)-y)+lambda/m*theta_r;
end
