%% Color the data based on its category
function plotDataPoints_h(X,idx)
  
  K = max(idx);
  cmap = hsv(K+1);  % (K+1,3)
  color = cmap(idx,:);  % (m,3)
  
  scatter(X(:,1),X(:,2),20,color);
  
end