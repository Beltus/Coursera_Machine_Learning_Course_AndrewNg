function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%


% randomly reorder training indices e.g randperm(10) returns [4   10    3    2    8    5    9    6    7    1]
randidx = randperm(size(X, 1));

% set the first K-examples  as cluster computeCentroids
centroids = X(randidx(1:K),:);


% =============================================================

end
