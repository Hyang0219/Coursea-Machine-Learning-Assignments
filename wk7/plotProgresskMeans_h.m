%% Plot the computation of the centroids and color the data in groups
function plotProgresskMeans_h(X,idx,current_centroids,prev_centroids)
  
  plotDataPoints_h(X,idx);
  
  K = max(idx);
  for i=1:K
    
    hold on;
    drawLine_h(prev_centroids(i,:),current_centroids(i,:));
    
  end
  
end