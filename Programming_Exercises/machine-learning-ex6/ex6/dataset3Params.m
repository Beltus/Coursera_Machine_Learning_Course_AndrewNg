function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
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


C_values = [0.01 0.03 0.1 0.3 1 3 10 30];

sigma_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];


c_max = 0;
sigma_max = 0;
temp_error = 1000000;

%loop iterates through different combinations of C and sigma values
for i = 1 : length(C_values),

  for j = 1 : length(sigma_values),

      % setting different values of the hyparameter C for the cost function
        C_temp =  C_values(i) ;

        % sigma value for gaussian kernel of the SVm
        sigma_temp = sigma_values(j);

        %train the SVM with gaussian kernel using training dataset
        model = svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));

        %make predictions on the validation set
        predictions = svmPredict(model , Xval);

        %calculate the prediction error based on the number of misclassifications
        error = mean(double(predictions ~= yval));

        % compare if error obtained with C and sigma combination is best
        if error < temp_error,
              c_max = C_values(i); %
              sigma_max = sigma_values(j);

              temp_error = error;
        end;

  end;
end;

%return best combination of C and sigma parameters based on minimum error of SVM
C = c_max;
sigma = sigma_max;

% =========================================================================

end
