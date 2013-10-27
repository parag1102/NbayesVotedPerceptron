function [model] = perceptron_train(Xtrain,Ytrain)
    s=size(Xtrain);
    countTrainEg = s(1,1);
    dim = s(1,2);
    ourYtrain=(2*Ytrain)-1;
    k=1;t=0;T=10;
    
    c=zeros(1,1);
    ws=zeros(1,dim);
    temp=[];
    
    while t<T
        for ind=1:countTrainEg
            if (ourYtrain(ind,1))*( dot(ws(k,:)',Xtrain(ind,:)') )<=0
                temp=ws(k,:)+(ourYtrain(ind,1)*Xtrain(ind,:));
                ws=[ws;temp];
                c=[c;1];
                k=k+1;
            else
                c(k,1)=c(k,1)+1;
            end
        end
        t=t+1;
    end
    
    model = [c ws];
end