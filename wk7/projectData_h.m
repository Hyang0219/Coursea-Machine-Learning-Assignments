%% Project data onto Principal Component
function [z] = projectData_h(X,U);
  
  z = X*U;
  
end