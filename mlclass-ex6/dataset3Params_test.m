function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

%C_options = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
%sigma_options = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

C_options = [1];
sigma_options = [0.1];
output_table = zeros(length(C_options)*length(sigma_options),3);
output_count = 1;

% Set C and sigma
for C_iter=1:length(C_options)
	for sigma_iter=1:length(sigma_options)
		C_cur = C_options(1, C_iter);
		sigma_cur = sigma_options(1, sigma_iter);

		% Train the model using C and sigma
		model= svmTrain(X, y, C_cur, @(x1, x2) gaussianKernel(x1, x2, sigma_cur));

		% compare model with actual data
		predictions = svmPredict(model, Xval);
		prediction_error = mean(double(predictions ~= yval));

		output_table(output_count, 1) = C_cur;
		output_table(output_count, 2) = sigma_cur;
		output_table(output_count, 3) = prediction_error;
		output_count = output_count + 1;
		
		fprintf(['C, sigma, error are:\n\t%f\n\t%f\n\t%f\n'], C_cur, sigma_cur, prediction_error);
	endfor
endfor
[min_value, min_index] = min(output_table);
output_table
min_index
output_table(min_index(1,3), :)

% =========================================================================

end
