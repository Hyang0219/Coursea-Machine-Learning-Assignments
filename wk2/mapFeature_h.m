%% Map features to higher order polynomial
function X_new = mapFeature_h(X1,X2,power)
  
  % Initialise X_new
  X_new = ones(size(X1(:,1)));
  
  for i=1:power
    for j=0:i
      X_new(:,end+1) = X1.^(i-j).*X2.^(j);
    end
  end
  
end