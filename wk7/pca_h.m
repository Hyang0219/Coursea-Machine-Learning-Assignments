%% Principal Component Analysis
function [U,S] = pca_h(X)
  
  m = size(X,1);
  
  % Compute covariance matrix
  Sigma = 1/m*X'*X;  % (n,n)

  % SVD
  [U,S,V] = svd(Sigma);
  
end