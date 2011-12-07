function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Calc hypothesis (since it's used later)
h = X*theta;	% makes a matrix of m x 1 entries

% Cost function (with regularization term) - (adapted from ex1 and ex3)
J_Reg = (lambda/(2*m))*sum( (theta(2:end).^2) );
J = (1/(2*m)) * sum( (h-y) .^2) + J_Reg;

% Gradient (with regularization term) - (adapted from ex3)
grad_Reg = [zeros(1,columns(theta)); (1/m)*(lambda*theta(2:end))];
grad = (1/m) * ((h-y)'*X)' + grad_Reg;

% =========================================================================

grad = grad(:);

end
