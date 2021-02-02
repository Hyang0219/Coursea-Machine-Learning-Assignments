%% Compute numerical gradient of the model
function grad = computeNumericalGradient_h(J,params)
  
  grad = zeros(size(params));
  e = 1e-4;

  for i=1:numel(params)
    loss1 = params;
    loss2 = params;
    loss1(i) = params(i)+e;
    loss2(i) = params(i)-e;
    
    grad(i) = (J(loss1) - J(loss2))/(2*e);
    
  end
  
end