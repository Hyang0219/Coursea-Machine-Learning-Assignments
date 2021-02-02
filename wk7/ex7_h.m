%% Initialization
clear ; close all; clc

% Load data1 and plot
%load('ex7data2.mat');
%plot(X(:,1), X(:,2),'rx');
%hold off;
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Select an initial set of centroids
%K = 3; % 3 Centroids
%initial_centroids = kMeansInitCentroids(X,K);
%
%% Compute centroids index for sampling data
%[idx] = findClosestCentroids_h(X,initial_centroids);
%
%% Visualise the first three centroids assignment of the training dataset X
%fprintf('\nThe first three items are assigned to the following centroids:\n')
%fprintf('%d\n', idx(1:3));
% 
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Compute the updated centroids after initial_centroids
%[centroids] = computeCentroids_h(X,idx);
%fprintf('\nThe updated centroids are:\n');
%fprintf(' %f %f \n' , centroids');
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Plot the progress
%runkMeans_h(X,initial_centroids,10);
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% Image compression with K-means
fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image of a bird
A = double(imread('flower.png'));  % (128,128,3)
A = A/225;  % So all pixels are within (0,1)

% Transform A into 2D matrix
[m,n,k] = size(A);
A_comp = reshape(A,m*n,k);  % (128*128,3)

% Group using K-Means
K = 16;
max_iters = 10;
initial_centroids = kMeansInitCentroids(A_comp,K);  % (K,3)
[centroids] = runkMeans_h(A_comp,initial_centroids,max_iters);  %  (K,3)
[idx] = findClosestCentroids_h(A_comp,centroids);  % (128*128,3)

% Re-assign rgb code to centroids
A_comp = centroids(idx,:);

% Reshape A_comp back to original dimension and rgb code
A_recover = reshape(A_comp,m,n,k);  % (128,128,3)

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(A_recover)
title(sprintf('Compressed, with %d colors.', K));
