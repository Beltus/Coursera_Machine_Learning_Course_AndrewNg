function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

%loop over all clusters
for j = 1 : K,

%initialize sum of training examples belonging to cluster j
sum_training = zeros(1 , n);

%initialize counter for the number of training examples belonging to each cluster j
count = 0;

%loop over all centroid indices- same length as number of training examples
    for i = 1 : m,

% if training example i, belongs to cluster j
        if idx(i) == j,

        %add the all training examples belonging to cluster j together
          sum_training = sum_training + X(i , :);

          count = count + 1 ;
       end;
    end;

%assign new cluster centroid position for each cluster
    centroids(j, :) = (1 / count) * sum_training;
end;







% =============================================================


end
