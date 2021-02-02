%% Initialization
clear ; close all; clc

%% load and plot data
%load('ex7data1.mat');
%plot(X(:,1),X(:,2),'bo');
%axis([0.5 6.5 2 8]); axis square;
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%[m,n] = size(X);
%
%% Perform feature normalisation
%[X_norm, mu, sigma] = featureNormalize(X);
%
%% PCA
%[U,S] = pca_h(X_norm);
%
%%  Compute mu, the mean of the each feature
%
%%  Draw the eigenvectors centered at mean of data. These lines show the
%%  directions of maximum variations in the dataset.
%hold on;
%drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
%drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
%hold off;
%
%fprintf('Top eigenvector: \n');
%fprintf(' U(:,1) = %f %f \n', U(1,1), U(2,1));
%fprintf('\n(you should expect to see -0.707107 -0.707107)\n');
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Project X on principal component
%K=1;
%U_reduce = U(:,1:K);  % (n,K)
%z = projectData_h(X_norm,U_reduce);
%z_recover = recoverData_h(z,U_reduce);
%
%fprintf('Projection of the first example: %f\n', z(1));
%fprintf('Recoverd first example from principal component is: %f %f\n', z_recover(1,1), z_recover(1,2));
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Visualise original and recovered data
%fprintf('\nVisualise orignial samples and recovered sample:\n');
%
%figure;
%plot(X_norm(:,1),X_norm(:,2),'bo');
%hold on;
%plot(z_recover(:,1),z_recover(:,2),'ro');
%axis([-4 3 -4 3]); axis square
%
%for i=1:size(X_norm,1)
%  drawLine_h(X_norm(i,:),z_recover(i,:),'--k','LineWidth', 1);
%end
%
%hold off;
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Load data
%load('ex7faces.mat');
%
%% Visualise faces
%m = 100;  % Draw the first 100 faces
%displayData_h(X,m);
%
%fprintf('Program paused. Press enter to continue.\n');
%pause;
%
%% Perform feature normalisation
%[X_norm, mu, sigma] = featureNormalize(X);
%
%% PCA
%[U,S] = pca_h(X_norm);
%
%% Project X_norm on principal component
%K=100;
%U_reduce = U(:,1:K);  % (n,K)
%z = projectData_h(X_norm,U_reduce);
%z_recover = recoverData_h(z,U_reduce);
%
%% Visualise compressed image
%subplot(1,2,1);
%displayData_h(X,m);
%title('Orignial Faces');
%subplot(1,2,2);
%displayData_h(z_recover,m);
%title('Recovered Faces')

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% Running PCA to visualise data in 2D

% Load data
A = double(imread('bird_small.png'));

A = A/225;
img_size = size(A);
A_res = reshape(A,img_size(1)*img_size(2),img_size(3));
K = 16;
max_iters = 10;
initial_centroids = kMeansInitCentroids(A_res, K);
[centroids] = runkMeans_h(A_res,initial_centroids,max_iters);
[idx] = findClosestCentroids_h(A_res,centroids);

%  Sample 1000 random indexes (since working with all the data is
%  too expensive. If you have a fast computer, you may increase this.
sel = floor(rand(1000, 1) * size(A_res, 1)) + 1;

%  Setup Color Palette
palette = hsv(K);
colors = palette(idx(sel), :);

%  Visualize the data and centroid memberships in 3D
figure;
scatter3(A_res(sel, 1), A_res(sel, 2), A_res(sel, 3), 10, colors);
title('Pixel dataset plotted in 3D. Color shows centroid memberships');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Running PCA
A_norm = featureNormalize(A_res);  % (m,n)
[U,S] = pca_h(A_norm);
K = 2;
U_reduce = U(:,1:K);  % (n,k)
A_proj = projectData_h(A_norm,U_reduce);  % (m,k)

% Plot in 2D
figure;
scatter(A_proj(sel,1),A_proj(sel,2),10,colors);
title('Pixel dataset plotted in 2D. Color shows centroid memberships');


