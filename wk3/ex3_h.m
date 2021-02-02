%% Initialization
clear ; close all; clc

%% Load data where X(5000,400) and y(5000,1)
load('ex3data1.mat');

%% Random select 100 numbers within the training set
[m,n] = size(X);
rand_indices = randperm(m);
sel = X(rand_indices(1:100),:);

displayData(sel);

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Training One-vs-All classifier
X = [ones(m,1) X];
initial_theta = zeros(n+1,1);   % initial_theta(401,1)
lambda = 3;
Theta = oneVsAll_h(X,y,initial_theta,lambda);

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Check training accuracy
predictions = predictOneVsAll_h(Theta,X);
accuracy = sum(predictions==y)/length(y);

fprintf('\nTraining Set Accuracy: %f\n', accuracy*100);