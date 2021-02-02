%% Compute the closet centroids of a given data
function [idx] = findClosestCentroids_h(X,centroids)
  
  idx = zeros(size(X,1),1);  % (m,1)
  
  for i=1:size(X,1)
    
    distance = sqrt(sum(((X(i,:)-centroids).^2),2));  % (K,1)
    [min_val, idx(i)] = min(distance);
    
  end

end