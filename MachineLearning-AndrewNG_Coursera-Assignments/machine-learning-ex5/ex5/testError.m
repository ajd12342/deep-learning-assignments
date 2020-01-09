function [error_test] = testError(X,y,Xtest,ytest,lambda)
[theta]=trainLinearReg(X,y,lambda);
[error_test,grad]=linearRegCostFunction(Xtest,ytest,theta,0);
end