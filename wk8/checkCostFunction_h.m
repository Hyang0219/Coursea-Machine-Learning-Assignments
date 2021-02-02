%% Check if numerical gradient equals analytical gradient
function checkCostFunction_h(params,Y,R,num_movies,num_users,num_features,lambda)
  
  % Compute analytical gradient
  [J grad] = cofiCostFunc_h(params,Y,R,num_movies,num_users,num_features,lambda);
  
  % Compute numerical gradient
  grad_num = computeNumericalGradient_h(@(p)...
          cofiCostFunc_h(p,Y,R,num_movies,num_users,num_features,lambda),...
          params);
  
  disp([grad_num grad]);
  fprintf(['The above two columns you get should be very similar.\n' ...
         '(Left-Your Numerical Gradient, Right-Analytical Gradient)\n\n']);

  diff = norm(grad_num-grad)/norm(grad_num+grad);
  fprintf(['If your cost function implementation is correct, then \n' ...
         'the relative difference will be small (less than 1e-9). \n' ...
         '\nRelative Difference: %g\n'], diff);
  
end