%% Create funciton to compute cost function and gradient
function [J_history, theta] = grad_desc(X,y,alpha,num_iter)
  
  % Variable sizes - X(m,n), y(m,1), theta(n+1,1)
  
  % Initialize
  m = size(X)(1);
  n = size(X)(2);
  theta = zeros(n+1,1);
  X = [ones(m,1) X];  % add intercept term
  
  J_history = zeros(num_iter,1);
  
  % Gradient descent
  for i=1:num_iter
    J_history(i) = 1/(2*m)*sum(X*theta-y).^2;
    theta = theta - alpha/m*(X'*(X*theta-y));
  end
  
end