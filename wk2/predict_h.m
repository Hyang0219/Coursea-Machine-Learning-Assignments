%% Predict probability using the classifier
function [prob] = predict_h(X,theta)
  
  % Define size of input variables
  [m,n] = size(X);
  
  % Add intercept term to X
  X = [ones(m,1),X];
  
  % Predict probability
  prob = sigmoid_h(X*theta);
  
  % Using classifer to define admitted or not addmitted
  pos = find(prob>=0.5);
  neg = find(prob<0.5);
  prob(pos) = 1;
  prob(neg) = 0;
  
end
