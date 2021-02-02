%% Compuate cost function for the neural networs
function [J,grad] = nnCostFunction_h(X,y,nn_theta,input_size,...
                                     hidden_layer_size,output_size,...
                                     lambda)
  
  % Dimentions
  % X(5000,400), y(5000,1), nn_theta unrolled form of Theta1 and Theta2
  % input_size (400), hidden_layer_size (25), output_layer (10)
  
  % roll to obtain  original Theta1 and Theta2
  theta1 = reshape(nn_theta(1:(input_size+1)*hidden_layer_size),...
                  hidden_layer_size,input_size+1); % (25,401)
  theta2 = reshape(nn_theta((input_size+1)*hidden_layer_size+1:end),...
                  output_size,hidden_layer_size+1); % (10,26)
  
  m = size(X,1);
  
  %% Forward propagation
  a1 = [ones(m,1) X]; % (5000,401)
  z2 = a1*theta1'; %(5000,25)
  a2 = sigmoid(z2); %(5000,25)
  a2 = [ones(m,1) a2]; % (5000,26)
  z3 = a2*theta2'; % (5000,10)
  a3 = sigmoid(z3); % (5000,10)
  
  % Turn output vector into matrix
  y = (y==(1:output_size)); % (5000,10)
  
  % Compute cost function
  J = 1/m*sum(sum(-y.*log(a3)-(1-y).*log(1-a3)))+...
      lambda/2/m*(sum(sum(theta1(:,2:end).^2))+...
      sum(sum(theta2(:,2:end).^2)));

  
  % Initialise D - overall error
  D1 = 0;
  D2 = 0;
  
  % For loop to compute back propagation
  for i = 1:m
    
    % Step 1 - compute forward propagation
    
    a1 = [1, X(i,:)]; % (1,401)
    z2 = a1*theta1'; % (1,25)
    a2 = [1, sigmoid(z2)]; % (1,26)
    z3 = a2*theta2'; % (1,10)
    a3 = sigmoid(z3); % (1,10)
    
    % Step 2 - Compute error in each layer
    delta3 = a3 - y(i,:); % (1,10)
    delta2 = delta3*theta2(:,2:end).*sigmoidGradient_h(z2); % (1,25)
    
    % Step3 - Compute D
    D2 += delta3'*a2; % (10,26)
    D1 += delta2'*a1; % (25,401)
    
  end
  
  D1(:,1) = 1/m*D1(:,1); % (25,1)
  D1(:,2:end) = 1/m*D1(:,2:end) + lambda/m*theta1(:,2:end); % (25,400)
  D2(:,1) = 1/m*D2(:,1); % (10,1)
  D2(:,2:end) = 1/m*D2(:,2:end) + lambda/m*theta2(:,2:end); % (10,25)
  
  % Step 4 - Compute gradient
  grad = [D1(:);D2(:)];
  

end