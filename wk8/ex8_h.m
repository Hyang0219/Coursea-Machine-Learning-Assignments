%% Initialization
clear ; close all; clc

% Load data and visualse
load('ex8data1.mat');
plot(X(:,1),X(:,2),'bx');
xlabel('Latency(ms)');
ylabel('Throughput(mb/s)');
axis([0 30 0 30]);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Visualizing Gaussian fit.\n\n');

%  Estimate my and sigma2
[mu sigma2] = estimateGaussian_h(X);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
p = multivariateGaussian_h(X, mu, sigma2);

%  Visualize the fit
visualizeFit_h(X,  mu, sigma2);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Compute the optimal epsilon and F1 score
pval = multivariateGaussian_h(Xval,mu,sigma2);
[epsilon, F1_socre] = selectThreshold_h(yval,pval);

fprintf('\nThe optimal epsilon value is %f, and corresponding F1 Score is %f:\n', epsilon, F1_socre);

% Highlight the anomalies
hold on;
index = find(p < epsilon);
plot(X(index,1),X(index,2),'ro','MarkerSize', 10);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Run anomaly on a more complicated dataset
load('ex8data2.mat');

%  Estimate my and sigma2
[mu sigma2] = estimateGaussian_h(X);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
p = multivariateGaussian_h(X, mu, sigma2);

% Compute the optimal epsilon and F1 score
pval = multivariateGaussian_h(Xval,mu,sigma2);
[epsilon, F1_socre] = selectThreshold_h(yval,pval);
num_anomaly = sum(p < epsilon);

fprintf('\nThe optimal epsilon is: %e\n', epsilon);
fprintf('There are %d number of anomalies found.\n',num_anomaly);

