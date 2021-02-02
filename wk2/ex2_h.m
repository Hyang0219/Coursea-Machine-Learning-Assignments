%% Initialization
clear ; close all; clc

%% Load data
data = load('ex2data1.txt');

%% Assign input and output variable
X = data(:,1:2);
y = data(:,3);

%% Plot data with different marker for positive and negative
plotData(X, y);
hold on;
xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted','Not Admitted');
hold off;

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Compute cost function using initial theta
[m,n] = size(X);

%% Adding intercept term
X = [ones(m,1),X];

%% Initialise theta
initial_theta = zeros(n+1,1);

%% Compute J based on theta
J = costFunctionReg_h(X,y,initial_theta);
fprintf('Initial cost is');
fprintf('\n%f',J);

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Compute minimum cost and corresponding theta using fminunc
% Set options for fminunc
options = optimset('GradObj','on','MaxIter',400);

% Run fminunc to obtain the optimal theta
% This function will return theta and the cost
[theta, cost] = fminunc(@(t)(costFunctionReg_h(X,y,t)), initial_theta, options);

fprintf('Final parameters are');
fprintf('\n%f',theta);
fprintf('\nFinal cost is');
fprintf('\n%f',cost);

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Plot decision boundary
plotDecisionBoundary_h(X,y,theta);

%% Predict
test_score = [45 85; 80,10];
decision = predict_h(test_score,theta);

fprintf('\nFinal decision on student sample is');
fprintf('\n%f',decision);

%% pause
fprintf('\nProgram paused. Press enter to continue.\n');
pause;