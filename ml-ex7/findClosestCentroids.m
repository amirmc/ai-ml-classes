function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for m_iter=1:rows(X)
	k_values = zeros(1,K);
	for k_iter=1:K
		k_values(1, k_iter) = sumsq(X(m_iter,:) - centroids(k_iter,:));
	endfor
	[min_k, index_min] = min(k_values);
	idx(m_iter, 1) = index_min;
endfor

k_rows = [1:1:K];
for m_iter=1:rows(X)
	k_values = zeros(1,K);
	for k_iter=1:K
		k_values(1, k_iter) = sumsq(X(m_iter,:) - centroids(k_iter,:));
	endfor
	[min_k, index_min] = min(k_values);
	idx(m_iter, 1) = index_min;
endfor


% =============================================================

end

