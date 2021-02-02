%% Compute the mean and variance of the dataset features
function [mu,sigma2] = estimateGaussian_h(X)
  
  m = size(X,1);
  
  mu = 1/m*sum(X);
  
  sigma2_orig = 1/m*sum((X-mu).^2);  % original Gaussian - does not count in
                                     % multivariante correlation
  sigma2 = 1/m*(X-mu)'*(X-mu);  % Multiariate Gaussian
  
end