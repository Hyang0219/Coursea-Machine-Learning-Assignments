%% sigmoid_h function returns sigmoid value of the input
function g = sigmoid_h(z)
  g = 1./(1+e.^(-z));
end
