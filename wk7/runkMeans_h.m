%% Compute and plot the centroids transformation
function [current_centroids] = runkMeans_h(X,initial_centroids,max_iter)
  
  %prev_centroids = initial_centroids;
  current_centroids = initial_centroids;
  
  % plot
  %figure;
  
  for i = 1:max_iter
    
    idx = findClosestCentroids_h(X,current_centroids);
    %plotProgresskMeans_h(X,idx,current_centroids,prev_centroids);
    %title(sprintf('Iteration number %d ',i));
    %hold on;
    
    % Pause the see the progress
    %fprintf('Program paused. Press enter to continue.\n');
    %pause;
    %prev_centroids = current_centroids;
    current_centroids = computeCentroids_h(X,idx);
    
  end
  
end