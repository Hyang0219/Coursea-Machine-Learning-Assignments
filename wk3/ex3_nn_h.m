%% Implement the feedforward propagation algothrim of Neural Network

%% Initialization
clear ; close all; clc

% Load data training data
load('ex3data1.mat');       % X(5000,400) y(5000,1)

% load trained weights
load('ex3weights.mat');     % Theta1(25,401) Theta2(10,26)

% Predict

% Add intercept term to X
X = [ones(size(X,1),1) X];
pred = predict_h(Theta1,Theta2,X);
accuracy = mean(double(pred == y));

fprintf('\nThe accuracy of neural work is %f\n', accuracy);
