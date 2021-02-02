%% Predict using trained weights

function predictions = predict_h(theta1,theta2,X)
  
  z2 = X*theta1';                 % Dimension (5000,25)
  a2 = sigmoid(z2);               % Dimension (5000,25)
  % Add intercept
  a2 = [ones(size(a2,1),1) a2];   % Dimension (5000,26)
  z3 = a2*theta2';                % Dimension (5000,10)
  a3 = sigmoid(z3);               % Dimension (5000,10)
  
  [max_vals, indices] = max(a3'); % Dimension (10,5000)
  predictions =  indices';         % Dimension (5000,1)
  
end
