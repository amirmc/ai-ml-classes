function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

rowNumOfTrues = find(y==1);
rowNumOfFalses = find(y==0);

plot (X(rowNumOfTrues,1), X(rowNumOfTrues,2), 'm+', 'LineWidth', 4, 'markersize', 7);
plot (X(rowNumOfFalses,1), X(rowNumOfFalses,2), 'g^', 'MarkerSize', 4);

% =========================================================================

hold off;

end
