function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


X = [ones(m,1) , X];
%disp(size(X));

activation_units_vector = sigmoid(Theta1 * X') ; % returns the activation values for the first hidden unit of the neural network

%add the bias hidden unit

n = size(activation_units_vector, 2);

% Hidden layer
activation_units_vector = [ones(1 , n); activation_units_vector];

%output layer
output_layer_units_matrix = Theta2 * activation_units_vector;

% vector of predicted digits for all training examples
[max_val  p] = max(output_layer_units_matrix);

p = p';








% =========================================================================


end
