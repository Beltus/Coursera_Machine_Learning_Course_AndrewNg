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

% number of training examples in dataset, X
m = length(idx);

% vector to hold the distance between a training example and all the centroids
dist_vect = zeros(K, 1);

%loop over all training examples
for i = 1 : m,

  %loop to compute distance between each training example and all the centroids
    for j = 1 : K,

      %euclid distance between a training example and a centroid
        dist = sum((X(i , :) - centroids(j,:)).^2);

        %add to distanc vector
        dist_vect(j) = dist;
    end;

%min distance and its corresponding centroid index returned
    [min_dist , idx(i)] = min(dist_vect);
    dist_vect = zeros(K, 1);
end;









% =============================================================

end
