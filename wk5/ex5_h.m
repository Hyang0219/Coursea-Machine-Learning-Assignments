%% Initialization
clear ; close all; clc

%% Load data
load('ex5data1.mat');

%% Plot data
figure;
plot(X,y,'rx');
xlabel('Change in water level(x)');
ylabel('Water flowing out of the dam(y)');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Compute linear regression to fit the data
[m,n] = size(X);
theta = trainLinearReg_h([ones(m,1) X],y,0);  % lambda = 0 for linear relationship

% Plot linear regression model
hold on;
plot(X,[ones(m,1) X]*theta,'b-');
hold off;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Plot learning curve
learningCurve_h([ones(m,1) X],y,[ones(size(Xval,1),1) Xval],yval,0);     % lambda = 0 for linear relationship

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Train model with polynomial features and normalise Xtest with mu and sigma from X
p = 8;
[X_poly, mu, sigma] = featureNormalize(polyFeatures_h(X,p));  % Normalize
X_poly = [ones(m,1), X_poly];

% Normalize Xtest
Xtest_poly = polyFeatures_h(Xtest,p);
Xtest_poly = bsxfun(@minus,Xtest_poly,mu);
Xtest_poly = bsxfun(@rdivide,Xtest_poly,sigma);
Xtest_poly = [ones(size(Xtest_poly,1),1) Xtest_poly];

% Normalize Xval
Xval_poly = polyFeatures_h(Xval,p);
Xval_poly = bsxfun(@minus,Xval_poly,mu);
Xval_poly = bsxfun(@rdivide,Xval_poly,sigma);
Xval_poly = [ones(size(Xval_poly,1),1) Xval_poly];

% Plot learning curve
lambda = 3;
learningCurve_h(X_poly,y,Xval_poly,yval,lambda);

% Plot regression model
theta_poly = trainLinearReg_h(X_poly,y,lambda);
wl = linspace(-80,80,100)';   % (100,1)
wl_poly = polyFeatures_h(wl,p);
wl_poly = bsxfun(@minus,wl_poly,mu);
wl_poly = bsxfun(@rdivide,wl_poly,sigma);
wl_poly = [ones(size(wl_poly,1),1) wl_poly];
wf = wl_poly*theta_poly;

figure;
plot(X,y,'rx');
xlabel('Change in water level(x)');
ylabel('Water flowing out of the dam(y)');
title(sprintf('Learning curve with lambda = %f', lambda));
hold on;
plot(wl,wf,'b--');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Validation for Selecting Lambda 

[lambda_vec, error_train, error_val] = ...
    validationCurve(X_poly, y, Xval_poly, yval);
    
close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end