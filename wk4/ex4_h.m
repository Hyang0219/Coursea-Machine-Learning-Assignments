%% Initialization
clear ; close all; clc

%% Load data
load('ex4data1.mat');

%% Display 100 random numbers
select = randperm(size(X,1));
select = select(1:100);

fprintf('Loading data visualisation.\n');
displayData(X(select,:));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Forward Propagation
% Load weights and unroll parameters into a vector
load('ex4weights.mat');
nn_theta = [Theta1(:);Theta2(:)];

% Define neural network architecture
input_size = size(X,2);
hidden_layer_size = 25;
output_size = size(Theta2,1);

% Define regularization parameter
lambda = 1;

% Perform back propagation
[J,grad] = nnCostFunction_h(X,y,nn_theta,input_size,...
                     hidden_layer_size,output_size,...
                     lambda);
fprintf('The cost of nn is: %f\n', J);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nChecking Backpropagation... \n');

%%  Check gradients by running checkNNGradients
checkNNGradients_h;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Optimizing training
% Random initializaiton of weights
W1 = randInitializeWeights_h(hidden_layer_size,input_size); % (25,401)
W2 = randInitializeWeights_h(output_size,hidden_layer_size); % (10,26)
initial_nn_params = [W1(:);W2(:)];

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction_h(X,y,p,input_size,...
                                     hidden_layer_size,output_size,...
                                     lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_size + 1)), ...
                 hidden_layer_size, (input_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_size + 1))):end), ...
                 output_size, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Visualise weights
fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Preidcti and return accuracy
pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);