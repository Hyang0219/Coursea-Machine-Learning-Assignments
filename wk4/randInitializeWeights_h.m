%% Random initialise weights for back propagation
function W = randInitializeWeights_h(L_out,L_in)
  
  epsilon = sqrt(6)/sqrt(L_out+L_in);
  W = rand(L_out,L_in+1)*2*epsilon-epsilon;
  
end