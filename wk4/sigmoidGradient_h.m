%% Compute the sigmoid of the gradient
function grad = sigmoidGradient_h(z)
  
  grad = sigmoid(z).*(1-sigmoid(z));
  
end