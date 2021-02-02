%% Update Centroids
function [centroids] = computeCentroids_h(X,idx)
  
  K = max(idx);
  centroids = zeros(K,size(X,2));
  for i=1:K
    
    ind = find(idx==i);
    centroids(i,:) = mean(X(ind,:));
    
  end
  
end