function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
palette = hsv(K + 1);
colors = palette(idx, :);

% Plot the data
% scatter(X(:,1), X(:,2), 15, colors);  % This line hits a bug in the MacOSX version of Octave
% the following line is a workaround for the bug described above
colormap(jet); scatter(X(:,1), X(:,2), 15, idx);

end
