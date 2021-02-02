%% Plot learning curve for different training sample size
function learningCurve_h(X,y,Xval,yval,lambda)
  
  [m,n] = size(X);
  train_err = zeros(m,1);
  cv_err = zeros(m,1);
  
  % shuffle training set X
  % sel = randperm(m);
  % X = X(sel,:);
  % y = y(sel);
  
  %% Train model with #i sample size
  for i = 1:m
    
    [theta] = trainLinearReg_h(X(1:i,:),y(1:i),lambda);
    train_err(i) = linearRegCostFunction_h(X(1:i,:),y(1:i),theta,0);
    cv_err(i) = linearRegCostFunction_h(Xval,yval,theta,0);
    
  end 
  
  %% Plot training error and cross validation error
  figure;
  plot(1:m,train_err,'r-');
  hold on;
  plot(1:m,cv_err,'b-');
  xlabel('Training sample size');
  ylabel('Error');
  legend('Training Error','Cross-Validation Error');
  title(sprintf('Learning curve with lambda = %f', lambda));
  axis([0 13 0 150])
  hold off;
  
end