%% Predict number with traning set X
function pred = predictOneVsAll_h(theta,X)
  
  % Input dimension theta(10,401) X(5000,401)
  predictions = theta*X';         % (10,5000)
  [max_vals, indices] = max(predictions);   % indices (1,5000)
  pred = indices';                          % pred (5000,1)
  
end
