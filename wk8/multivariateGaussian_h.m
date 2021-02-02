%% Compute probability of the multivariante Gaussian distribution
function p = multivariateGaussian_h(X,mu,sigma2)
  
  [m,n] = size(X);
  
  if (size(sigma2, 2) == 1) || (size(sigma2, 1) == 1)
    sigma2 = diag(sigma2);
  end
  
  X = X-mu;
  p = (2*pi)^(-n/2)*det(sigma2)^(-1/2)*exp(-1/2*sum((X)*pinv(sigma2).*(X),2));
  
  %X = bsxfun(@minus, X, mu(:)');
  %p = (2 * pi) ^ (- n / 2) * det(sigma2) ^ (-0.5) * ...
    %exp(-0.5 * sum(bsxfun(@times, X * pinv(sigma2), X), 2));
  
end