%% Compute the cost function and gradient
function [J grad] = cofiCostFunc_h(params,Y,R,num_movies,num_users,num_features,lambda);
  
  % Roll the input vectors to matrix to vectorisation
  X = reshape(params(1:num_movies*num_features),num_movies,num_features);
  Theta = reshape(params(num_movies*num_features+1:end),num_users,num_features);

  J = 0.5*sum(sum((X*Theta'-Y).^2.*R))+lambda/2*sum(sum(Theta.^2))+...
  lambda/2*sum(sum(X.^2));
  X_grad = (X*Theta'-Y).*R*Theta + lambda*X;
  Theta_grad = ((X*Theta'-Y).*R)'*X + lambda*Theta;
  
  % Unroll gradient
  grad = [X_grad(:);Theta_grad(:)];
  
end