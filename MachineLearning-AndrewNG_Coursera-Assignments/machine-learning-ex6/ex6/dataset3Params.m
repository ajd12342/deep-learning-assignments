function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
%load('ex6data3.mat');
% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%{
test=[0.01,0.03,0.1,0.3,1,3,10,30];
results=[];
for iter1=1:8
for iter2=1:8
	model=svmTrain(X,y,test(iter1),@(x1,x2) gaussianKernel(x1,x2,test(iter2)));
	error=mean(double(svmPredict(model,Xval)~=yval));
	results=[results;test(iter1),test(iter2),error];
	[test(iter1),test(iter2),error]
end
end
[m minindex]=min(results(:,3));
C=results(minindex,1);
sigma=results(minindex,2);
fprintf("Minimum");
[C,sigma,m]
%}


% =========================================================================

end
