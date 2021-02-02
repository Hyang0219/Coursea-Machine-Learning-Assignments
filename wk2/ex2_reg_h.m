%% Initialization
clear ; close all; clc

%% Load data
data = load('ex2data2.txt');

%% Plot the data
X = data(:,1:2);
y = data(:,3);
plotData(X,y);

%% Add necessary information
hold on;
xlabel('Microship Test 1');
ylabel('Microchip Test 2');
legend('Accepted','Not accepted');
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Add intercept term to X
X = mapFeature_h(X(:,1),X(:,2),6);
[m,n] = size(X);

%% Compute cost on initial theta
initial_theta = zeros(n,1);
lambda = 1;
[J_initial, grad] = costFunctionReg_h(X,y,initial_theta,lambda);

fprintf('\nInitial cost is calculated:');
fprintf('\n%f',J_initial);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Learning parameters using fminunc
% Set options for fminunc
options = optimset('GradObj','on','MaxIter',400);

% Run fminunc to obtain the optimal theta
% This function will return theta and the cost
[theta, cost] = fminunc(@(t)(costFunctionReg_h(X,y,t,lambda)), initial_theta, options);

fprintf('Final parameters are');
fprintf('\n%f',theta);
fprintf('\nFinal cost is');
fprintf('\n%f\n',cost);

% Plot Boundary
plotDecisionBoundary_h(X,y,theta);
xlabel('Microship Test1');
ylabel('Microship Test2');
legend('y=1','y=0','Decision boundary');
title(sprintf('lambda = %g',lambda));