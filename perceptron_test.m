function [Pred_pr] = perceptron_test(model,Xtest)
    s=size(model);
    K = s(1,1);
    si=size(Xtest);
    countTestEg=si(1,1);
    
    ourPred_pr=zeros(countTestEg,1);
    Pred_pr=zeros(countTestEg,1);
    
    c=model(:,1);
    ws=model(:,2:end);
            
    for ind=1:countTestEg
        for k=1:K
            if dot(Xtest(ind,:),ws(k,:))>0
                ourPred_pr(ind,1)=ourPred_pr(ind,1)+c(k,1);
            else
                ourPred_pr(ind,1)=ourPred_pr(ind,1)-c(k,1);
            end
        end
    end
    
    for ind=1:countTestEg
        if ourPred_pr(ind,1)>0
            Pred_pr(ind,1)=1;
        else
            Pred_pr(ind,1)=0;
        end
    end
end