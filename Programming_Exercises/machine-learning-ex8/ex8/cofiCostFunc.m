function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);


% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the
%                     partial derivatives w.r.t. to each element of Theta
%




% predicted ratings of each movie by each user
 rating_prediction = X * Theta'; %size = movies X users

% error is ratings prediction
rating_error = rating_prediction - Y ;

% return only errors for movies for which there existed a rating given a user
rating_error_factor = rating_error .* R ;

%compute unregularized cost
J = (1/2) * sum(sum((rating_error_factor).^2));


% gradient of X features and modep parameters THETAs

X_grad = rating_error_factor * Theta;

Theta_grad = rating_error_factor' * X;



% CostFunction with regularization for the features X and model parameters THETAs

X_cost_regularizer = (lambda / 2) * sum(sum(X.^2)); %regularization term for the X features

Theta_cost_regularizer = (lambda / 2) * sum(sum(Theta.^2)); % regularization term for the Thetas(model parameters)

J = J + X_cost_regularizer + Theta_cost_regularizer; % regularized cost function

% regularized gradients

X_grad = X_grad + lambda * X;

Theta_grad = Theta_grad + lambda * Theta;




% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
