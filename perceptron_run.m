function []=perceptron_run(Xtrain, Ytrain, Xtest, Ytest)
            
    [model] = perceptron_train(Xtrain,Ytrain);
    [Pred_per]=perceptron_test(model,Xtest);

    combine = [Ytest,Pred_per];
    
    tp=sum( (combine(:,1)==1) & (combine(:,2)==1) );
    tn=sum( (combine(:,1)==0) & (combine(:,2)==0) );
    fp=sum( (combine(:,1)==0) & (combine(:,2)==1) );
    fn=sum( (combine(:,1)==1) & (combine(:,2)==0) );

    precision = tp / (tp + fp);
    recall = tp / (tp + fn);
    accuracy = (tp + tn)/(tp+fp+fn+tn);
        
    save Pred_per.mat Pred_per;
    fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);
end