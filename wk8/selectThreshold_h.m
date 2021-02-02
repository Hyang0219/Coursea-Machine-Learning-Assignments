%% Select the thresold
function [epsilon, F1_socre] = selectThreshold_h(yval,pval)
  
  cvPredictions = zeros(length(pval),1);
  epsilon = 0;
  F1_socre = 0;
  
  stepsize = (max(pval) - min(pval)) / 1000;
  for e = min(pval):stepsize:max(pval)
    
    cvPredictions(pval<e) = 1;
    tp = sum((cvPredictions==1) & (yval==1));
    fp = sum((cvPredictions==1) & (yval==0));
    fn = sum((cvPredictions==0) & (yval==1));
    
    prec = tp/(tp+fp);
    rec = tp/(tp+fn);
    
    F1 = 2*prec*rec/(prec+rec);
    
    if F1 > F1_socre
      epsilon = e;
      F1_socre = F1;
    end
    
  end  
    
  
end