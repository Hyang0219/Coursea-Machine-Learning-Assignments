%% Initialization
clear ; close all; clc

%% Load the data
data = load('ex1data1.txt');

%% Assign input features and output
X = data(:,1);
y = data(:,2);

%% Plot data
plot(X,y,'rx','Markersize',10);
ylabel('Profit in $10,000');
xlabel('Population of City in 10,000');

%% Pause until further instructions
fprintf('Program paused. Press enter to continue.\n');
pause;

%% Run gradient descent and output cost and theta
[J_history, theta] = grad_desc(X, y, 0.01, 1500);

% Print out to screen
fprintf('Cost found by gradient descent:\n');
fprintf('Cost = %f\n', J_history(length(J_history)));
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the convergence graph
figure;
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
hold on;
plot(1:50, J_history(1:50), '-g', 'LineWidth', 2);

%% Plot History of linear regression
hold on;
plot(X,[ones(length(X),1),X]*theta);

%% Visualise J in 3D
theta_0 = linspace(-10,10,40);
theta_1 = linspace(-1,4,length(theta_0));

J_vals = zeros(length(theta_0),length(theta_1));
for i = 1:length(theta_0)
  for j = 1:length(theta_1)
    J_vals(i,j) = computeCost([ones(length(X),1),X], y, [theta_0(i);theta_1(j)]);
  end
end

J_vals = J_vals';
% Surface plot
figure;
surf(theta_0, theta_1, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
