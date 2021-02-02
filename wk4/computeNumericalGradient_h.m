%% Perform gradient checking to make sure back progation is bug-free
function grad_checking = computeNumericalGradient_h(X,y,nn_theta,input_size,...
                                                    hidden_layer_size,output_size,...
                                                    lambda)
  n = size(nn_theta);
  grad_checking = zeros(n,1);
  epsilon = 1e-4;
  for i =1:n
    
    theta_plus = nn_theta;
    theta_plus(i) = theta_plus(i) + epsilon;
    theta_minus = nn_theta;
    theta_minus(i) = theta_minus(i) - epsilon;
    
    cost_plus = nnCostFunction_h(X,y,theta_plus,input_size,...
                               hidden_layer_size,output_size,...
                               lambda);
    cost_minus = nnCostFunction_h(X,y,theta_minus,input_size,...
                                hidden_layer_size,output_size,...
                                lambda);
                                
    grad_checking(i) = (cost_plus-cost_minus)/(2*epsilon);
  end   
  
end