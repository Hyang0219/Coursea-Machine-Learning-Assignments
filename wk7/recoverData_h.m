% recover data from principal component
function [z_recover] = recoverData_h(z,U)
  
  z_recover = z*U';
  
end